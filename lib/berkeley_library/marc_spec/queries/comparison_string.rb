require 'berkeley_library/marc_spec/queries/part'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class ComparisonString
        include Part

        # ------------------------------------------------------------
        # Accessors

        attr_reader :str_raw, :str_exact

        # ------------------------------------------------------------
        # Initializer

        def initialize(str_raw)
          @str_raw = str_raw.to_s
          @str_exact = unescape(@str_raw)
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          "\\#{str_raw}"
        end

        # ------------------------------------------------------------
        # Protected methods

        protected

        def equality_attrs
          [:str_raw]
        end

        def unescape(str_raw)
          str_raw.gsub(/\\(?=[${}!=~?|])/, '').gsub(/\\s/, ' ')
        end

      end
    end
  end
end
