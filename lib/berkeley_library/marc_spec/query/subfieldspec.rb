module BerkeleyLibrary
  module MarcSpec
    module Query
      class Subfieldspec
        attr_reader :tag, :index, :subfield

        def initialize(tag:, index: nil, subfield:)
          @tag = tag
          @index = index
          @subfield = subfield
        end
      end
    end
  end
end
