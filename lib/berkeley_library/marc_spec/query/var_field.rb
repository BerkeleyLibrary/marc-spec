require 'berkeley_library/marc_spec/query/predicate'

module BerkeleyLibrary
  module MarcSpec
    module Query
      class VarField
        include Predicate

        # ------------------------------------------------------------
        # Attributes

        attr_reader :tag, :subfield

        # ------------------------------------------------------------
        # Initializer

        def initialize(tag, subfield:)
          @tag = ensure_type(tag, Tag)
          @subfield = ensure_type(subfield, Subfield, allow_nil: true)
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          [tag, subfield].join
        end

        # ------------------------------------------------------------
        # Predicate

        protected

        def equality_attrs
          %i[tag subfield]
        end
      end
    end
  end
end