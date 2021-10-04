require 'berkeley_library/marc_spec/query/predicate'

module BerkeleyLibrary
  module MarcSpec
    module Query
      class FieldValue
        include Predicate

        # ------------------------------------------------------------
        # Attributes

        attr_reader :tag

        # ------------------------------------------------------------
        # Initializer

        def initialize(tag)
          @tag = ensure_type(tag, Tag)
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          tag.to_s
        end

        # ------------------------------------------------------------
        # Predicate

        protected

        def to_s_inspect
          tag.inspect
        end

        def equality_attrs
          %i[tag]
        end
      end
    end
  end
end
