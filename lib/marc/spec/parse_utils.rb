require 'marc/spec/parse_utils/closed_range'

module MARC
  module Spec
    module ParseUtils
      MARC_MAX_OCTETS = 99_999

      def closed_range
        ClosedRange.new
      end

    end
  end
end
