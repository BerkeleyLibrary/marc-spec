require 'berkeley_library/marc_spec/queries/part'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class Query
        include Part

        attr_reader :referent
        attr_reader :condition

        def initialize(referent, *conditions)
          raise ArgumentError, 'referent cannot be nil' unless referent

          @referent = referent
          @condition = normalize_conditions(conditions)
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          StringIO.new.tap do |out|
            out << referent
            out << "{#{condition}}" if condition
          end.string
        end

        # ------------------------------------------------------------
        # Protected methods

        protected

        def to_s_inspect
          StringIO.new.tap do |out|
            out << referent.inspect
            out << "{#{condition.inspect}}"
          end.string
        end

        def equality_attrs
          %i[referent condition]
        end

        # ------------------------------------------------------------
        # Private

        def normalize_conditions(conditions)
          compacted = conditions.compact
          return if compacted.empty?

          normalized = compacted.map { |c| normalize_condition(c) }
          as_tree(normalized)
        end

        def normalize_condition(condition)
          condition.unary? ? condition : Condition.new(condition.operator, left: referent, right: condition.right)
        end

        def as_tree(conditions)
          return conditions[0] if conditions.size == 1

          Condition.new('&&', left: conditions[0], right: as_tree(conditions[1..]))
        end

      end
    end
  end
end
