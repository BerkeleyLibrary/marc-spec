module BerkeleyLibrary
  module MarcSpec
    module Query
      class Fieldspec
        attr_reader :tag, :index, :character_spec

        # TODO: split tag (=field) lookup from character lookup
        def initialize(tag:, index: nil, character_spec: nil)
          @tag = tag
          @index = index
          @character_spec = character_spec
        end
      end
    end
  end
end
