require 'berkeley_library/marc_spec/queries/field_value'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class IndicatorValue < FieldValue

        # ------------------------------------------------------------
        # Constants

        VALID_INDICATORS = [1, 2].freeze

        # ------------------------------------------------------------
        # Attributes

        attr_reader :tag, :ind

        # ------------------------------------------------------------
        # Initializer

        def initialize(tag, ind)
          super(tag)
          @ind = valid_indicator(ind)
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          [super, ind].join('^')
        end

        # ------------------------------------------------------------
        # Referent

        def can_apply?(marc_obj)
          [:indicator1, :indicator2].all? { |m| marc_obj.respond_to?(m) }
        end

        # ------------------------------------------------------------
        # Protected methods

        protected

        def do_apply(marc_obj)
          if ind == 1
            marc_obj.indicator1
          elsif ind == 2
            marc_obj.indicator2
          end
        end

        def to_s_inspect
          [super, ind].join('^')
        end

        def equality_attrs
          super + %i[ind]
        end

        private

        def valid_indicator(ind_val)
          ind = int_or_nil(ind_val)
          return ind if VALID_INDICATORS.include?(ind)

          raise ArgumentError, "Not a valid indicator: #{ind_val.inspect}"
        end
      end
    end
  end
end
