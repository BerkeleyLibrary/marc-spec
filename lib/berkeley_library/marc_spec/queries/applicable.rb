require 'berkeley_library/marc_spec/queries/part'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      # Supermodule of query objects that can return a result
      module Applicable
        include Part

        def apply(marc_obj)
          return [] unless _can_apply?(marc_obj)

          _do_apply(marc_obj)
        end

        protected

        # :nocov:
        def can_apply?(_marc_obj)
          false
        end
        # :nocov:

        # :nocov:
        def do_apply(_marc_obj)
          # default implementation does nothing
        end
        # :nocov:

        private

        def _can_apply?(marc_object)
          send(:can_apply?, marc_object)
        end

        def _do_apply(marc_object)
          send(:do_apply, marc_object)
        end

      end
    end
  end
end
