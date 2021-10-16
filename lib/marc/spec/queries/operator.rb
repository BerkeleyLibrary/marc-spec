require 'typesafe_enum'

module MARC
  module Spec
    module Queries
      # NOTE: && and || are not defined in the MARCspec standard but are
      #       implementation details of repeated (AND) and chained (OR) subspecs
      #       -- see https://marcspec.github.io/MARCspec/marc-spec.html#general
      class Operator < TypesafeEnum::Base

        # ------------------------------------------------------------
        # Enum instances

        new(:EQ, '=') do
          def apply(lr, rr)
            return false if rr.nil?
            return rarr_eq?(lr, rr) if rr.is_a?(Array)
            return larr_eq?(lr, rr) if lr.is_a?(Array)

            lr == rr
          end

          def larr_eq?(larr, rr)
            larr.any? { |l| apply(l, rr) }
          end

          def rarr_eq?(lr, rarr)
            rarr.any? { |r| apply(lr, r) }
          end
        end

        new(:NEQ, '!=') do
          def apply(lr, rr)
            !Operator::EQ.apply(lr, rr)
          end
        end

        new(:INCL, '~') do
          def apply(lr, rr)
            return false if [lr, rr].any?(&:nil?) # TODO: is this right?
            return rarr_incl?(lr, rr) if rr.is_a?(Array)
            return larr_incl?(lr, rr) if lr.is_a?(Array)

            lr.include?(rr)
          end

          def larr_incl?(larr, rr)
            larr.any? { |l| apply(l, rr) }
          end

          def rarr_incl?(lr, rarr)
            rarr.any? { |r| apply(lr, r) }
          end
        end

        new(:NINCL, '!~') do
          def apply(lr, rr)
            !Operator::INCL.apply(lr, rr)
          end
        end

        new(:NEXIST, '!') do
          def apply(right)
            right.is_a?(Array) ? right.empty? : right.nil?
          end
        end

        new(:EXIST, '?') do
          def apply(right)
            !Operator::NEXIST.apply(right)
          end
        end

        new(:AND, '&&') do
          def apply(left, right)
            left && right
          end
        end

        new(:OR, '||') do
          def apply(left, right)
            left || right
          end
        end

        # ------------------------------------------------------------
        # Class methods

        class << self
          def from_str(op_str)
            Operator.find_by_value(op_str.to_s).tap do |op|
              raise ArgumentError, "No such operator: #{op_str}" unless op
            end
          end
        end

        # ------------------------------------------------------------
        # Operator

        def binary?
          ![Operator::EXIST, Operator::NEXIST].include?(self)
        end

        def logical?
          [Operator::AND, Operator::OR].include?(self)
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          op_str
        end

        # @return [String]
        def op_str
          # noinspection RubyMismatchedReturnType
          value
        end

        def to_expression(left, right)
          return ["(#{left})", self, "(#{right})"].join if logical?

          [left, self, right].join
        end
      end
    end
  end
end
