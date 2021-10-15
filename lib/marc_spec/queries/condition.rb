require 'marc_spec/queries/condition_context'
require 'marc_spec/queries/part'
require 'marc_spec/queries/operator'

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

        @left = left_operand(left) if binary?
        @right = right_operand(right)
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

      def met?(condition_context)
        # puts self

        right_val = condition_context.operand_value(right)
        # puts "\t#{right.inspect} -> #{right_val.inspect}"
        return unary_apply(right_val) unless binary?

        left_val = condition_context.operand_value(left, implicit: true)
        # puts "\t#{left.inspect} -> #{left_val.inspect}"
        binary_apply(left_val, right_val)
      end

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
        operator.to_expression(left, right)
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

      def binary_apply(left_val, right_val)
        operator.apply(left_val, right_val).tap do |_result|
          # puts "\t#{left_val} #{operator} #{right_val} => #{_result}"
        end
      end

      def unary_apply(right_val)
        operator.apply(right_val).tap do |_result|
          # puts "\t#{operator} #{right_val} => #{_result}"
        end
      end

      def right_operand(right)
        return right if right.is_a?(ComparisonString)

        operand(right)
      end

      def left_operand(left)
        operand(left) if left
      end

      # TODO: superinterface?
      def operand(operand)
        return operand if operand.is_a?(Condition) || operand.is_a?(Query)
        return Query.new(tag: operand) if operand.is_a?(Tag)

        raise ArgumentError, "Unknown operand type: #{operand.inspect}"
      end

      def binary?
        operator.binary?
      end

    end
  end
end
