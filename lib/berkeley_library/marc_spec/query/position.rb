module BerkeleyLibrary
  module MarcSpec
    module Query
      class Position
        attr_reader :position

        def initialize(position)
          @position = position ? position.to_i : nil
        end
      end
    end
  end
end
