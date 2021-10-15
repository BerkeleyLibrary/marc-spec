require 'marc_spec/queries/part'

module MarcSpec
  module Queries
    class Query
      include Part

      attr_reader :tag, :selector, :condition, :subqueries

      # TODO: separate factory methods for possible cases? (see transform.rb)
      # TODO: separate query (w/o subqueries) from wrapper w/subqueries?
      def initialize(tag: nil, selector: nil, condition: nil, subqueries: [])
        @tag = ensure_type(tag, Tag, allow_nil: true)
        # TODO: do we need the Selector interface at all?
        @selector = ensure_type(selector, Applicable, allow_nil: true)
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

      # TODO: don't support nested subqueries
      def execute(executor, context_fields, context_result = nil)
        fields = tag ? executor.apply_tag(tag) : context_fields
        return [] if fields.empty?

        field_results = root_results(fields, executor, context_result)
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

      def root_results(fields, executor, context_result)
        field_results = results_for_fields(executor, fields)
        # TODO: something less ridiculous
        return field_results unless field_results.empty? && select_from_context?(context_result)

        selector.apply(context_result)
      end

      def select_from_context?(context_result)
        tag.nil? && context_result && selector.can_apply?(context_result)
      end

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
