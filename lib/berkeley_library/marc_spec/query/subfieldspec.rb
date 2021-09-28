module BerkeleyLibrary
  module MarcSpec
    module Query
      class Subfieldspec
        attr_reader :tag, :index, :subfield

        # TODO: use FieldSpec instead of FieldTag + index
        def initialize(tag:, index: nil, subfield:)
          @tag = tag
          @index = index
          @subfield = subfield
        end
      end
    end
  end
end
