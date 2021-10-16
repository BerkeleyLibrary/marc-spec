require 'marc/spec/queries/position_or_range'

module MARC
  module Spec
    module Queries
      class Position
        include PositionOrRange

        # ------------------------------------------------------------
        # Attributes

        attr_reader :position

        def initialize(position)
          @position = int_or_nil(position)
        end

        # ------------------------------------------------------------
        # Instance methods

        # @overload select_from(seq)
        #   Selects the value at the specified position and returns it as a
        #   single-element array, for compatibility with AlNumRange
        #   @param seq [Array] the input array
        #   @return [Array] a single-element array containing the result, or
        #     an empty array if the index is out of bounds
        # @overload select_from(seq)
        #   Selects the character at the specified position
        #   @param seq [String] the input array
        #   @return [String, nil] a single-element array, or nil if the index
        #     is out of bounds
        def select_from(seq)
          # we use raw_result[-1] instead of raw_result.last b/c seq might be a string
          raw_result = seq[position.nil? ? -1 : position]
          seq.is_a?(String) ? wrap_string_result(raw_result) : wrap_array_result(raw_result)
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          (position || '#').to_s
        end

        # ------------------------------------------------------------
        # Protected methods

        protected

        # ------------------------------
        # Part

        def equality_attrs
          [:position]
        end
      end
    end
  end
end
