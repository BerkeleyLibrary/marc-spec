require 'marc/spec/queries/applicable'

module MARC
  module Spec
    module Queries
      # Marker interface for query objects that select data from fields
      module Selector
        include Applicable
      end
    end
  end
end
