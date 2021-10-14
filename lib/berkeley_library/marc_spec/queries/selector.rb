require 'berkeley_library/marc_spec/queries/applicable'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      # Marker interface for query objects that select data from fields
      module Selector
        include Applicable
      end
    end
  end
end
