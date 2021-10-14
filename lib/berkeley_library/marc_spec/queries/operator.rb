require 'typesafe_enum'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      # NOTE: && and || are not defined in the MARCspec standard but are
      #       implementation details of repeated (AND) and chained (OR) subspecs
      #       -- see https://marcspec.github.io/MARCspec/marc-spec.html#general
      class Operator < TypesafeEnum::Base

        # ------------------------------------------------------------
        # Enum instances

        new(:EQ, '=') do
          # def do_apply(lr, rr)
          #   return false if [lr, rr].any?(&:nil?) # TODO: is this right?
          #   return rarr_eq?(lr, rr) if rr.is_a?(Array)
          #   return larr_eq?(lr, rr) if lr.is_a?(Array)
          #
          #   str_value(lr) == str_value(rr)
          # end
          #
          # def larr_eq?(larr, rr)
          #   larr.any? { |l| do_apply(l, rr) }
          # end
          #
          # def rarr_eq?(lr, rarr)
          #   rarr.any? { |r| do_apply(lr, r) }
          # end
        end

        new(:NEQ, '!=') do
          # def do_apply(lr, rr)
          #   !Operator::EQ.do_apply(lr, rr)
          # end
        end

        new(:INCL, '~') do
          # def do_apply(lr, rr)
          #   return false if [lr, rr].any?(&:nil?) # TODO: is this right?
          #   return rarr_incl?(lr, rr) if rr.is_a?(Array)
          #   return larr_incl?(lr, rr) if lr.is_a?(Array)
          #
          #   lv = str_value(lr)
          #   rv = str_value(rr)
          #   lv.include?(rv)
          # end
          #
          # def larr_incl?(larr, rr)
          #   larr.any? { |l| do_apply(l, rr) }
          # end
          #
          # def rarr_incl?(lr, rarr)
          #   rarr.any? { |r| do_apply(lr, r) }
          # end
        end

        new(:NINCL, '!~') do
          # def do_apply(lr, rr)
          #   !Operator::INCL.do_apply(lr, rr)
          # end
        end

        new(:NEXIST, '!') do
          # def do_apply(_, rr)
          #   rr.is_a?(Array) ? rr.empty? : rr.nil?
          # end
        end

        new(:EXIST, '?') do
          # def do_apply(lr, rr)
          #   !Operator::NEXIST.do_apply(lr, rr)
          # end
        end

        new(:AND, '&&') do
          # def apply(left, right, context)
          #   left.met?(context) && right.met?(context)
          # end
        end

        new(:OR, '||') do
          # def apply(left, right, context)
          #   left.met?(context) || right.met?(context)
          # end
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
      end
    end
  end
end