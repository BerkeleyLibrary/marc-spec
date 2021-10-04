require 'berkeley_library/marc_spec/query/part'

module BerkeleyLibrary
  module MarcSpec
    module Query
      class AlNumRange
        include Part

        # ------------------------------------------------------------
        # Attributes

        attr_reader :from, :to

        # ------------------------------------------------------------
        # Initializer

        def initialize(from, to)
          @from, @to = parse_endpoints(from, to)
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

        private

        def parse_endpoints(from, to)
          original_values = [from, to]
          if original_values.all? { |p| lc_alpha?(p) }
            original_values.map(&:to_s)
          else
            original_values.map { |p| int_or_nil(p) }
          end
        end

        def lc_alpha?(endpoint)
          endpoint_str = endpoint.to_s
          endpoint_str.size == 1 &&
            endpoint_str.ord >= 'a'.ord &&
            endpoint_str.ord <= 'z'.ord
        end
      end
    end
  end
end
