require 'berkeley_library/marc_spec/query/field_value'

module BerkeleyLibrary
  module MarcSpec
    module Query
      class VarFieldValue < FieldValue

        # ------------------------------------------------------------
        # Attributes

        attr_reader :subfield

        # ------------------------------------------------------------
        # Initializer

        def initialize(tag, subfield)
          super(tag)
          @subfield = ensure_type(subfield, Subfield, allow_nil: true)
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          [super, subfield].join
        end

        # ------------------------------------------------------------
        # Predicate

        protected

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
