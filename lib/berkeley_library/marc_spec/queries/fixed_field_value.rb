require 'stringio'
require 'berkeley_library/marc_spec/queries/selector'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class FixedFieldValue
        include Selector

        # ------------------------------------------------------------
        # Attributes

        attr_reader :character_spec

        # ------------------------------------------------------------
        # Initializer

        def initialize(character_spec = AlNumRange.new(0, nil))
          @character_spec = position_or_range(character_spec)
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          StringIO.new.tap do |out|
            out << "/#{character_spec}"
          end.string
        end

        # ------------------------------
        # Applicable

        def can_apply?(marc_obj)
          # MARC leader is ControlField-like but is returned as string
          marc_obj.is_a?(MARC::ControlField) || marc_obj.is_a?(String)
        end

        # ------------------------------------------------------------
        # Protected methods

        protected

        # ------------------------------
        # Applicable

        def do_apply(control_field)
          value_str = string_value_from(control_field)
          return value_str unless character_spec

          character_spec.select_from(value_str)
        end

        # ------------------------------
        # Predicate

        def equality_attrs
          %i[character_spec]
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
