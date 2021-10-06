require 'berkeley_library/marc_spec/queries/part'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class Position
        include Part

        # ------------------------------------------------------------
        # Attributes

        attr_reader :position

        def initialize(position)
          @position = int_or_nil(position)
        end

        # ------------------------------------------------------------
        # Instance methods

        def select_from(seq)
          # we don't use `.last` b/c seq might be a string
          seq[position.nil? ? -1 : position]
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
