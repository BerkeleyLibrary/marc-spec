require 'berkeley_library/marc_spec/query/part'

module BerkeleyLibrary
  module MarcSpec
    module Query
      class Position
        include Part

        # ------------------------------------------------------------
        # Attributes

        attr_reader :position

        def initialize(position)
          @position = int_or_nil(position)
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          (position || '#').to_s
        end

        # ------------------------------------------------------------
        # Part

        protected

        def equality_attrs
          [:position]
        end
      end
    end
  end
end
