require 'berkeley_library/marc_spec/query/field_value'

module BerkeleyLibrary
  module MarcSpec
    module Query
      class IndicatorValue < FieldValue

        # ------------------------------------------------------------
        # Constants

        VALID_INDICATORS = [nil, 1, 2].freeze

        # ------------------------------------------------------------
        # Attributes

        attr_reader :tag, :ind

        # ------------------------------------------------------------
        # Initializer

        def initialize(tag, ind:)
          super(tag)
          @ind = indicator_or_nil(ind)
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          [super, ind].join('^')
        end

        # ------------------------------------------------------------
        # Predicate

        protected

        def to_s_inspect
          [super, ind].join('^')
        end

        def equality_attrs
          super + %i[ind]
        end

        private

        def indicator_or_nil(ind)
          int_or_nil(ind).tap do |indicator|
            raise ArgumentError, "Not a valid indicator: #{v.inspect}" unless VALID_INDICATORS.include?(indicator)
          end
        end
      end
    end
  end
end
