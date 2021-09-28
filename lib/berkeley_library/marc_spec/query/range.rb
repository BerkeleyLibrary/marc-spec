module BerkeleyLibrary
  module MarcSpec
    module Query
      class Range
        attr_reader :from
        attr_reader :to

        def initialize(from, to)
          @from = from ? from.to_i : nil
          @to = to ? to.to_i : nil
        end
      end
    end
  end
end
