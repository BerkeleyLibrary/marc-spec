require 'berkeley_library/marc_spec/queries/part'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      # Supermodule of complete query objects
      module Predicate
        include Part
      end
    end
  end
end
