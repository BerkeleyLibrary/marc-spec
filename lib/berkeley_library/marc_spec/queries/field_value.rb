require 'berkeley_library/marc_spec/queries/referent'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class FieldValue
        include Referent

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
        # Protected methods

        protected

        # ------------------------------
        # Part

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
