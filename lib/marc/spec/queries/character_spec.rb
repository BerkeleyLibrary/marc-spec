require 'stringio'
require 'marc/spec/queries/selector'

module MARC
  module Spec
    module Queries
      class CharacterSpec
        include Selector

        # ------------------------------------------------------------
        # Attributes

        attr_reader :character_spec

        # ------------------------------------------------------------
        # Initializer

        def initialize(character_spec = AlNumRange.new(0, nil))
          @character_spec = ensure_type(character_spec, PositionOrRange, allow_nil: false)
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          "/#{character_spec}"
        end

        # ------------------------------
        # Applicable

        def can_apply?(marc_obj)
          # MARC leader is ControlField-like but is returned as string
          [String, MARC::ControlField, MARC::Subfield].any? { |t| marc_obj.is_a?(t) }
        end

        # ------------------------------------------------------------
        # Protected methods

        protected

        # ------------------------------
        # Applicable

        def do_apply(control_field)
          field_value = field_value_for(control_field)
          field_value ? [field_value] : []
        end

        # ------------------------------
        # Part

        def equality_attrs
          %i[character_spec]
        end

        def to_s_inspect
          "/#{character_spec.inspect}"
        end

        # ------------------------------------------------------------
        # Private methods

        private

        def field_value_for(control_field)
          value_str = string_value_from(control_field)
          return value_str unless character_spec

          character_spec.select_from(value_str)
        end

        def string_value_from(tag_result)
          return tag_result if tag_result.is_a?(String)
          return tag_result.value if tag_result.respond_to?(:value)
        end

      end
    end
  end
end
