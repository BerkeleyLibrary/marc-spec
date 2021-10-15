require 'berkeley_library/marc_spec/queries/part'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class Query
        include Part

        attr_reader :tag, :selector, :condition, :subqueries

        # TODO: separate query (w/o subqueries) from wrapper w/subqueries?
        def initialize(tag: nil, selector: nil, condition: nil, subqueries: [])
          @tag = ensure_type(tag, Tag, allow_nil: true)
          @selector = ensure_type(selector, Selector, allow_nil: true)
          @condition = ensure_type(condition, Condition, allow_nil: true)
          @subqueries = subqueries.map { |sq| ensure_type(sq, Query) }
        end

        def to_s
          StringIO.new.tap do |out|
            out << tag if tag
            out << selector if selector
            out << "{#{condition}}" if condition
            out << subqueries.join
          end.string
        end

        def execute(executor, context_fields)
          fields = tag ? executor.apply_tag(tag) : context_fields
          return [] if fields.empty?

          # TODO: don't support nested subqueries
          field_results = results_for_fields(executor, fields)
          return field_results if subqueries.empty?

          fields.each_with_object([]) do |field, results|
            subqueries.each do |subquery|
              subquery_results = subquery.execute(executor, [field])
              results.concat(subquery_results)
            end
          end
        end

        protected

        def equality_attrs
          %i[tag selector condition subqueries]
        end

        # rubocop:disable Metrics/AbcSize
        def to_s_inspect
          StringIO.new.tap do |out|
            out << tag.inspect if tag
            out << selector.inspect if selector
            out << "{#{condition.inspect}}" if condition
            out << subqueries.map(&:inspect).join
          end.string
        end
        # rubocop:enable Metrics/AbcSize

        private

        def results_for_fields(executor, fields)
          fields.each_with_object([]) do |field, results|
            field_results = results_for_field(executor, field)
            results.concat(field_results)
          end
        end

        def results_for_field(executor, field)
          results = executor.apply_selector(selector, field)
          return results unless condition

          results.select { |result| executor.condition_met?(condition, field, result) }
        end

      end
    end
  end
end
