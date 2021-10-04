require 'stringio'
require 'berkeley_library/marc_spec/queries/field_value'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class FixedFieldValue < FieldValue

        # ------------------------------------------------------------
        # Attributes

        attr_reader :position, :range

        # ------------------------------------------------------------
        # Initializer

        def initialize(tag, character_spec)
          super(tag)
          @position, @range = select_type(character_spec, Position, AlNumRange)
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
