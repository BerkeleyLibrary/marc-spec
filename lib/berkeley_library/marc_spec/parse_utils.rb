require 'berkeley_library/marc_spec/parse_utils/closed_int_range'
require 'berkeley_library/marc_spec/parse_utils/closed_lc_alpha_range'

module BerkeleyLibrary
  module MarcSpec
    module ParseUtils
      MARC_MAX_OCTETS = 99_999

      def closed_int_range
        ClosedIntRange.new
      end

      def closed_lc_alpha_range
        ClosedLcAlphaRange.new
      end
    end
  end
end
