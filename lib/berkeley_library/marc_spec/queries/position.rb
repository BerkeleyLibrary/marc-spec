require 'berkeley_library/marc_spec/queries/part'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class Position
        include Part

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
          # we use result[-1] instead of result.last b/c seq might be a string
          result = seq[position.nil? ? -1 : position]
          return result if seq.is_a?(String)

          result.nil? ? [] : [result]
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          (position || '#').to_s
        end

        # ------------------------------------------------------------
        # Part

        protected

        def equality_attrs
          [:position]
        end
      end
    end
  end
end
