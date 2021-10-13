require 'berkeley_library/marc_spec/queries/selector'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class VarFieldValue < Selector

        # ------------------------------------------------------------
        # Attributes

        attr_reader :subfield

        # ------------------------------------------------------------
        # Initializer

        def initialize(subfield)
          # TODO: Separate VarFieldValue types?
          @subfield = of_any_type(subfield, Subfield, SubfieldValue, allow_nil: false)
        end

        # ------------------------------------------------------------
        # Applicable

        def can_apply?(marc_obj)
          marc_obj.respond_to?(:subfields)
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          subfield.to_s
        end

        # ------------------------------------------------------------
        # Protected methods

        protected

        def do_apply(data_field)
          subfield.apply(data_field)
        end

        def to_s_inspect
          subfield.inspect
        end

        def equality_attrs
          [:subfield]
        end

      end
    end
  end
end
