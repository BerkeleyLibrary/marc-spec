require 'stringio'
require 'berkeley_library/marc_spec/queries/selector'
require 'berkeley_library/marc_spec/queries/subfield'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class SubfieldValue
        include Selector

        # ------------------------------------------------------------
        # Attributes

        attr_reader :subfield, :character_spec

        # ------------------------------------------------------------
        # Initializer

        def initialize(subfield, character_spec = nil)
          @subfield = ensure_type(subfield, Subfield)
          @character_spec = position_or_range(character_spec, allow_nil: true)
        end

        # ------------------------------------------------------------
        # Applicable

        def can_apply?(marc_obj)
          subfield.can_apply?(marc_obj)
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
        # Protected

        protected

        def do_apply(data_field)
          subfields = subfield.apply(data_field)
          return subfields.map(&:value) unless character_spec

          subfields.map { |sf| character_spec.select_from(sf.value) }
        end

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
