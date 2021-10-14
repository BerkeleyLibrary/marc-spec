require 'berkeley_library/marc_spec/queries/part'
require 'berkeley_library/marc_spec/queries/operator'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class Condition
        include Part

        # ------------------------------------------------------------
        # Attributes

        attr_reader :left, :operator, :right

        # ------------------------------------------------------------
        # Initializer

        # rubocop:disable Style/KeywordParametersOrder
        def initialize(operator = '?', left: nil, right:)
          @operator = Operator.from_str(operator)
          # TODO: verify left semantics for unary operators
          #       see: https://marcspec.github.io/MARCspec/marc-spec.html#general
          #            https://marcspec.github.io/MARCspec/marc-spec.html#subspec-interpretation

          # TODO: superinterface?
          @left = of_any_type(left, Tag, Condition, Query, allow_nil: true) if binary?
          @right = of_any_type(right, Tag, Condition, Query, ComparisonString)
        end
        # rubocop:enable Style/KeywordParametersOrder

        # ------------------------------------------------------------
        # Static factory methods

        class << self
          def any_of(*conditions)
            conditions.inject do |cc, c|
              cc.or(c)
            end
          end

          def all_of(*conditions)
            conditions.inject { |cc, c| cc.and(c) }
          end
        end

        # ------------------------------------------------------------
        # Instance methods

        def and(other_condition)
          return self if other_condition == self || other_condition.nil?

          Condition.new('&&', left: self, right: other_condition)
        end

        def or(other_condition)
          return self if other_condition == self || other_condition.nil?

          Condition.new('||', left: self, right: other_condition)
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          return ["(#{left})", operator, "(#{right})"].join if [Operator::AND, Operator::OR].include?(operator)

          [left, operator, right].join
        end

        # ------------------------------------------------------------
        # Protected methods

        protected

        def to_s_inspect
          [left.inspect, operator, right.inspect].join(' ')
        end

        def equality_attrs
          %i[left operator right]
        end

        private

        def binary?
          operator.binary?
        end

      end
    end
  end
end
