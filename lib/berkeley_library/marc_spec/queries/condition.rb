require 'berkeley_library/marc_spec/queries/part'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class Condition
        include Part

        # ------------------------------------------------------------
        # Attributes

        attr_reader :left, :operator, :right

        # ------------------------------------------------------------
        # Initializer

        # rubocop:disable Style/KeywordParametersOrder
        def initialize(operator = '?', left: nil, right:)
          @left = left
          @operator = operator
          @right = right
        end
        # rubocop:enable Style/KeywordParametersOrder

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          [left, operator, right].join
        end

        # ------------------------------------------------------------
        # Protected methods

        protected

        def equality_attrs
          %i[left operator right]
        end
      end
    end
  end
end
