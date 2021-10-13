require 'berkeley_library/marc_spec/queries/applicable'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class Selector # TODO: make this a module
        include Applicable
      end
    end
  end
end
