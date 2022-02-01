require 'marc/spec/queries/comparison_string'
require 'marc/spec/queries/condition'
require 'marc/spec/queries/query'

module MARC
  module Spec
    module Queries
      class ConditionContext
        attr_reader :context_field, :context_result, :executor

        def initialize(context_field, context_result, executor)
          @context_field = context_field
          @context_result = context_result
          @executor = executor
        end

        def operand_value(operand, implicit: false)
          return operand_value(context_result) if implicit && operand.nil?

          raw_value = operand_value_raw(operand)
          is_boolean = [true, false].include?(raw_value)
          is_boolean ? raw_value : as_string(raw_value)
        end

        private

        def operand_value_raw(operand)
          return operand.str_exact if operand.is_a?(ComparisonString)
          return operand.met?(self) if operand.is_a?(Condition)
          return operand.execute(executor, [context_field], context_result) if operand.is_a?(Query)

          operand
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
end
