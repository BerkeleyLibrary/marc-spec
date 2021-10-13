require 'berkeley_library/marc_spec/queries/field_value'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class VarFieldValue < FieldValue

        # ------------------------------------------------------------
        # Attributes

        attr_reader :subfield

        # ------------------------------------------------------------
        # Initializer

        def initialize(tag, subfield)
          super(tag)
          @subfield = of_any_type(subfield, Subfield, SubfieldValue, allow_nil: false)
        end

        # ------------------------------------------------------------
        # Referent

        def can_apply?(marc_obj)
          marc_obj.respond_to?(:subfields)
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          [super, subfield].join
        end

        # ------------------------------------------------------------
        # Protected methods

        protected

        def do_apply(data_field)
          subfield.apply(data_field)
        end

        def to_s_inspect
          [super, subfield.inspect].join
        end

        def equality_attrs
          [:subfield] + super
        end

      end
    end
  end
end
