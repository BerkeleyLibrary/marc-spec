require 'berkeley_library/marc_spec/parsing/parser'
require 'berkeley_library/marc_spec/queries/referent'
require 'berkeley_library/marc_spec/queries/transform'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class Query
        include Referent

        # ------------------------------------------------------------
        # Attributes

        attr_reader :referent, :condition, :subqueries

        # ------------------------------------------------------------
        # Initializer

        def initialize(referent, *args)
          @referent = ensure_type(referent, Referent)

          condition, @subqueries = parse_args(args)
          @condition = condition.tap { |c| c.implicit_left = referent if c }
        end

        # ------------------------------------------------------------
        # Class methods

        class << self
          def from_string(query_str)
            parse_tree = Parsing::Parser.new.parse(query_str)
            Transform.new.apply(parse_tree)
          end
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          StringIO.new.tap do |out|
            out << referent
            out << "{#{condition}}" if condition
            out << subqueries.join.to_s unless subqueries.empty?
          end.string
        end

        # ------------------------------------------------------------
        # Referent

        def apply(marc_record)
          results = referent.apply(marc_record)
          # TODO: conditions
          return results unless subqueries.any?

          results.each_with_object([]) do |r, rr|
            subqueries.each { |sq| append_result(sq.apply(r), rr) }
          end
        end

        # ------------------------------------------------------------
        # Protected methods

        protected

        def to_s_inspect
          StringIO.new.tap do |out|
            out << referent.inspect
            out << "{#{condition.inspect}}" if condition
            out << subqueries.map(&:inspect).to_s unless subqueries.empty?
          end.string
        end

        def equality_attrs
          %i[referent condition subqueries]
        end

        private

        def parse_args(args)
          conditions, queries, referents = group_args_by_type(args)

          condition = conditions.inject { |cond, c| cond.and(c) }
          subqueries = queries.tap { |sqs| referents.each { |r| sqs << Query.new(r) } }

          [condition, subqueries]
        end

        def group_args_by_type(args)
          args_by_type = args.each_with_object({}) do |arg, by_type|
            arg_type = [Condition, Query, Referent].find { |t| arg.is_a?(t) }
            (by_type[arg_type] ||= []) << arg
          end

          [Condition, Query, Referent].map { |t| args_by_type[t] || [] }
        end

      end
    end
  end
end
