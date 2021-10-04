require 'berkeley_library/marc_spec/query/part'

module BerkeleyLibrary
  module MarcSpec
    module Query
      # Supermodule of complete query objects
      module Predicate
        include Part
      end
    end
  end
end
