require 'berkeley_library/marc_spec/queries/part'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      # Supermodule of possible query result objects
      module Referent
        include Part
      end
    end
  end
end
