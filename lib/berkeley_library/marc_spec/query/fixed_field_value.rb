require 'stringio'
require 'berkeley_library/marc_spec/query/field_value'

module BerkeleyLibrary
  module MarcSpec
    module Query
      class FixedField < FieldValue

        # ------------------------------------------------------------
        # Attributes

        attr_reader :position, :range

        # ------------------------------------------------------------
        # Initializer

        def initialize(tag, position_or_range:)
          super(tag)
          @position, @range = select_type(position_or_range, Position, AlphanumericRange)
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          StringIO.new.tap do |out|
            out << super
            position_or_range = position || range
            out << "/#{position_or_range}" if position_or_range
          end.string
        end

        # ------------------------------------------------------------
        # Predicate

        protected

        def equality_attrs
          %i[position range] + super
        end

      end
    end
  end
end
