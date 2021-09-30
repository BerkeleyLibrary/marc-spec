require 'berkeley_library/marc_spec/query/part'

module BerkeleyLibrary
  module MarcSpec
    module Query
      class Range
        include Part

        # ------------------------------------------------------------
        # Attributes

        attr_reader :from, :to

        # ------------------------------------------------------------
        # Initializer

        def initialize(from, to)
          @from = from ? from.to_i : nil
          @to = to ? to.to_i : nil
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          "#{from || '#'}-#{to || '#'}"
        end

        # ------------------------------------------------------------
        # Part

        protected

        def equality_attrs
          %i[from to]
        end
      end
    end
  end
end
