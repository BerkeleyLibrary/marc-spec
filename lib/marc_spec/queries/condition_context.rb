require 'marc_spec/queries/comparison_string'
require 'marc_spec/queries/condition'
require 'marc_spec/queries/query'

module MarcSpec
  module Queries
    class ConditionContext
      attr_reader :context_field, :context_result, :executor

      def initialize(context_field, context_result, executor)
        @context_field = context_field
        @context_result = context_result
        @executor = executor
      end

      def operand_value(operand, implicit: false)
        return context_result if implicit && operand.nil?

        raw_value = operand_value_raw(operand)
        is_boolean = [true, false].include?(raw_value)
        is_boolean ? raw_value : as_string(raw_value)
      end

      private

      def operand_value_raw(operand)
        return unless operand

        case operand
        when ComparisonString
          operand.str_exact
        when Condition
          operand.met?(self)
        when Query
          operand.execute(executor, [context_field], context_result)
        end
      end

      def as_string(op_val)
        return unless op_val
        return op_val if op_val.is_a?(String)
        return op_val.value if op_val.respond_to?(:value) && !op_val.is_a?(MARC::DataField)
        return op_val.map { |v| as_string(v) } if op_val.is_a?(Array)
      end
    end
  end
end
