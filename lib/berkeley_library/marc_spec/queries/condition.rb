require 'berkeley_library/marc_spec/queries/part'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class Condition
        include Part

        # ------------------------------------------------------------
        # Constants

        # NOTE: && and || are not defined in the MARCspec standard but are
        #       implementation details of repeated (AND) and chained (OR) subspecs
        #       -- see https://marcspec.github.io/MARCspec/marc-spec.html#general
        ALL_OPERATORS = %w[= != ~ !~ ! ? && ||].freeze
        UNARY_OPERATORS = %w[! ?].freeze

        # ------------------------------------------------------------
        # Attributes

        attr_reader :left, :operator, :right

        # ------------------------------------------------------------
        # Initializer

        # rubocop:disable Style/KeywordParametersOrder
        # TODO: verify left: nil semantics for unary operators
        #       see: https://marcspec.github.io/MARCspec/marc-spec.html#general
        #            https://marcspec.github.io/MARCspec/marc-spec.html#subspec-interpretation
        def initialize(operator = '?', left: nil, right:)
          @operator = valid_operator(operator)
          @left = left
          @right = right
        end
        # rubocop:enable Style/KeywordParametersOrder

        # ------------------------------------------------------------
        # Instance methods

        def unary?
          UNARY_OPERATORS.include?(operator)
        end

        def binary?
          !unary?
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          [left, operator, right].join
        end

        # ------------------------------------------------------------
        # Protected methods

        protected

        def equality_attrs
          %i[left operator right]
        end

        # ------------------------------------------------------------
        # Private methods

        def valid_operator(op_val)
          op_val.to_s.tap do |op|
            raise ArgumentError, "Not a valid operator: #{op_val.inspect}" unless ALL_OPERATORS.include?(op)
          end
        end

      end
    end
  end
end
