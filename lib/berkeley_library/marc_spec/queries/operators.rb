module BerkeleyLibrary
  module MarcSpec
    module Queries
      module Operators

        class << self
          def operation_for(op_val)
            OPERATIONS[op_val] || (raise ArgumentError, "Not a valid operator: #{op_val.inspect}")
          end

          def op_eq?(left, right)
            return right.nil? if left.nil? # TODO: is this right?
            return rarr_eq?(left, right) if right.is_a?(Array)
            return larr_eq?(left, right) if left.is_a?(Array)
            return left.op_eq?(right) if left.respond_to?(:op_eq?)

            left == right
          end

          def op_neq?(l, r)
            !op_eq?(l, r)
          end

          def op_incl?(left, right)
            return right.nil? if left.nil?
            return rarr_incl?(left, right) if right.is_a?(Array)
            return larr_incl?(left, right) if left.is_a?(Array)
            return left.op_incl?(right) if left.respond_to?(:op_incl?)

            left.respond_to?(:include?) && left.include?(right)
          end

          def op_nincl?(left, right)
            !op_incl?(left, right)
          end

          def op_exist?(_, right)
            !op_nexist?(nil, right)
          end

          def op_nexist?(_, right)
            right.is_a?(Array) ? right.empty? : right.nil?
          end

          def op_and?(left, right)
            [left, right].all? { |c| condition_met?(c) }
          end

          def op_or?(left, right)
            [left, right].any? { |c| condition_met?(c) }
          end

          private

          def condition_met?(cond)
            cond.respond_to?(:met?) && cond.met?
          end

          def larr_eq?(larr, right)
            larr.any? { |l| op_eq?(l, right) }
          end

          def rarr_eq?(left, rarr)
            rarr.any? { |r| op_eq?(left, r) }
          end

          def larr_incl?(larr, right)
            larr.any? { |l| op_incl?(l, right) }
          end

          def rarr_incl?(left, rarr)
            rarr.any? { |r| op_incl?(left, r) }
          end
        end

        # ------------------------------------------------------------
        # Constants

        # NOTE: these need to be defined after the class methods above

        # NOTE: && and || are not defined in the MARCspec standard but are
        #       implementation details of repeated (AND) and chained (OR) subspecs
        #       -- see https://marcspec.github.io/MARCspec/marc-spec.html#general
        OPERATIONS = {
          '=' => Operators.method(:op_eq?),
          '!=' => Operators.method(:op_neq?),
          '~' => Operators.method(:op_incl?),
          '!~' => Operators.method(:op_nincl?),
          '?' => Operators.method(:op_exist?),
          '!' => Operators.method(:op_nexist?),
          '&&' => Operators.method(:op_and?),
          '||' => Operators.method(:op_or?)
        }.freeze

        UNARY_OPERATORS = %w[! ?].freeze

      end
    end
  end
end
