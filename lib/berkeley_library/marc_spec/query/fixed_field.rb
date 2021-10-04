require 'stringio'
require 'berkeley_library/marc_spec/query/predicate'
require 'berkeley_library/marc_spec/query/tag'

module BerkeleyLibrary
  module MarcSpec
    module Query
      class FixedField
        include Predicate

        # ------------------------------------------------------------
        # Attributes

        attr_reader :tag, :position, :range

        # ------------------------------------------------------------
        # Initializer

        def initialize(tag, position_or_range:)
          @tag = ensure_type(tag, Tag)
          @position, @range = select_type(position_or_range, Position, AlphanumericRange)
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          StringIO.new.tap do |out|
            out << tag
            position_or_range = position || range
            out << "/#{position_or_range}" if position_or_range
          end.string
        end

        # ------------------------------------------------------------
        # Predicate

        protected

        def equality_attrs
          %i[tag position range]
        end

      end
    end
  end
end
