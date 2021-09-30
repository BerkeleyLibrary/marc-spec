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
          @position = position ? position.to_i : nil
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
