require 'marc_spec/queries/selector'

module MarcSpec
  module Queries
    class IndicatorValue
      include Selector

      # ------------------------------------------------------------
      # Constants

      VALID_INDICATORS = [1, 2].freeze

      # ------------------------------------------------------------
      # Attributes

      attr_reader :tag, :ind

      # ------------------------------------------------------------
      # Initializer

      def initialize(ind)
        @ind = valid_indicator(ind)
      end

      # ------------------------------------------------------------
      # Object overrides

      def to_s
        "^#{ind}"
      end

      # ------------------------------
      # Applicable

      def can_apply?(marc_obj)
        %i[indicator1 indicator2].all? { |m| marc_obj.respond_to?(m) }
      end

      # ------------------------------------------------------------
      # Protected methods

      protected

      # ------------------------------
      # Applicable

      def do_apply(marc_obj)
        ind_val = ind_val_for(marc_obj)
        ind_val ? [ind_val] : []
      end

      def equality_attrs
        %i[ind]
      end

      private

      def ind_val_for(data_field)
        case ind
        when 1
          data_field.indicator1
        when 2
          data_field.indicator2
        end
      end

      def valid_indicator(ind_val)
        ind = int_or_nil(ind_val)
        return ind if VALID_INDICATORS.include?(ind)

        raise ArgumentError, "Not a valid indicator: #{ind_val.inspect}"
      end
    end
  end
end
