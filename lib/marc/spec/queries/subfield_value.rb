require 'stringio'
require 'marc/spec/queries/selector'
require 'marc/spec/queries/subfield'

module MARC
  module Spec
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
          @character_spec = ensure_type(character_spec, CharacterSpec, allow_nil: true)
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

        def can_apply?(marc_obj)
          subfield.send(:can_apply?, marc_obj)
        end

        def do_apply(data_field)
          subfields = subfield.apply(data_field)
          return subfields.map(&:value) unless character_spec

          subfields.flat_map { |sf| character_spec.apply(sf.value) }
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
