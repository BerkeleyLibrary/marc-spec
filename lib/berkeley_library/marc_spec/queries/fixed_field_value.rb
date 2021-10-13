require 'stringio'
require 'berkeley_library/marc_spec/queries/field_value'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class FixedFieldValue < FieldValue

        # ------------------------------------------------------------
        # Attributes

        attr_reader :character_spec

        # ------------------------------------------------------------
        # Initializer

        def initialize(tag, character_spec = nil)
          super(tag) # TODO: validate control vs. data?
          @character_spec = position_or_range(character_spec, allow_nil: true)
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          StringIO.new.tap do |out|
            out << super
            out << "/#{character_spec}" if character_spec
          end.string
        end

        # ------------------------------
        # Referent

        def can_apply?(marc_obj)
          marc_obj.is_a?(MARC::ControlField)
        end

        # ------------------------------------------------------------
        # Protected methods

        protected

        # ------------------------------
        # Referent

        def do_apply(control_field)
          value_str = string_value_from(control_field)
          return value_str unless character_spec

          character_spec.select_from(value_str)
        end

        # ------------------------------
        # Predicate

        def equality_attrs
          %i[character_spec] + super
        end

        # ------------------------------------------------------------
        # Private methods

        private

        def string_value_from(tag_result)
          return tag_result if tag_result.is_a?(String)
          return tag_result.value if tag_result.respond_to?(:value)
        end

      end
    end
  end
end
