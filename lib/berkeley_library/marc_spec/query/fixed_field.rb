require 'stringio'
require 'berkeley_library/marc_spec/query/predicate'

module BerkeleyLibrary
  module MarcSpec
    module Query
      class FixedField
        include Predicate

        # ------------------------------------------------------------
        # Attributes

        attr_reader :tag, :position_or_range

        # ------------------------------------------------------------
        # Initializer

        def initialize(tag, position_or_range:)
          @tag = tag
          @position_or_range = position_or_range
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          StringIO.new.tap do |out|
            out << tag
            out << "/#{position_or_range}" if position_or_range
          end.string
        end

        # ------------------------------------------------------------
        # Predicate

        protected

        def equality_attrs
          %i[tag position_or_range]
        end

      end
    end
  end
end
