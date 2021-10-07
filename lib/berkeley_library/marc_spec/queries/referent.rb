require 'berkeley_library/marc_spec/queries/part'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      # Supermodule of possible query result objects
      module Referent
        include Part

        def apply(marc_obj)
          do_apply(marc_obj) if can_apply?(marc_obj)
        end

        protected

        def can_apply?(_marc_obj)
          true
        end
      end
    end
  end
end
