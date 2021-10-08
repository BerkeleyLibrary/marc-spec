require 'berkeley_library/marc_spec/queries/part'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      # Supermodule of query objects that can return a result
      module Referent
        include Part

        def apply(marc_obj)
          do_apply(marc_obj) if can_apply?(marc_obj)
        end

        protected

        def can_apply?(_marc_obj)
          true
        end

        # :nocov:
        def do_apply(_marc_obj)
          # default implementation does nothing
        end
        # :nocov:

      end
    end
  end
end
