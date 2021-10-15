require 'marc_spec/queries/applicable'

module MarcSpec
  module Queries
    module PositionOrRange
      include Applicable

      protected

      def can_apply?(marc_obj)
        [String, Array, MARC::ControlField, MARC::Subfield].any? { |t| marc_obj.is_a?(t) }
      end

      def do_apply(marc_obj)
        value = marc_obj.respond_to?(:value) ? marc_obj.value : marc_obj
        select_from(value)
      end

    end
  end
end
