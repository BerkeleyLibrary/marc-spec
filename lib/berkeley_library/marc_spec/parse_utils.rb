require 'berkeley_library/marc_spec/parse_utils/closed_range'

module BerkeleyLibrary
  module MarcSpec
    module ParseUtils
      MARC_MAX_OCTETS = 99_999

      def closed_range
        ClosedRange.new
      end

    end
  end
end
