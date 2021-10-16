require 'marc/spec/queries/part'

module MARC
  module Spec
    module Queries
      # Supermodule of query objects that can return a result
      module Applicable
        include Part

        def apply(marc_obj)
          return [] unless can_apply?(marc_obj)

          do_apply(marc_obj)
        end
      end
    end
  end
end
