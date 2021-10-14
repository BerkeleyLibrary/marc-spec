require 'berkeley_library/marc_spec/queries/part'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      # Supermodule of query objects that can return a result
      module Applicable
        include Part

        def apply(marc_obj)
          do_apply(marc_obj) if can_apply?(marc_obj)
        end

        # :nocov:
        def can_apply?(_marc_obj)
          false
        end
        # :nocov:

        protected

        # :nocov:
        def do_apply(_marc_obj)
          # default implementation does nothing
        end
        # :nocov:

      end
    end
  end
end
