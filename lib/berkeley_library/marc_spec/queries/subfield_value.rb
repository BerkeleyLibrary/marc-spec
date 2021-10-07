require 'stringio'
require 'berkeley_library/marc_spec/queries/referent'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class SubfieldValue
        include Referent

        # ------------------------------------------------------------
        # Attributes

        attr_reader :subfield, :character_spec

        # ------------------------------------------------------------
        # Initializer

        def initialize(subfield, character_spec = nil)
          @subfield = subfield
          @character_spec = position_or_range(character_spec, allow_nil: true)
        end

        # ------------------------------------------------------------
        # Referent

        def apply(subfield)
          value = subfield.value
          character_spec ? character_spec.select_from(value) : value
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          StringIO.new.tap do |out|
            out << subfield
            out << "/#{character_spec}" if character_spec
          end.string
        end

        # ------------------------------------------------------------
        # Predicate

        protected

        def to_s_inspect
          StringIO.new.tap do |out|
            out << subfield.inspect
            out << "/#{character_spec.inspect}" if character_spec
          end.string
        end

        def equality_attrs
          %i[subfield character_spec]
        end
      end
    end
  end
end
