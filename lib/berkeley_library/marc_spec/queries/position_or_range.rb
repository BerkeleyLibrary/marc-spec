require 'berkeley_library/marc_spec/queries/applicable'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      module PositionOrRange
        include Applicable

        def can_apply?(marc_obj)
          [String, Array, MARC::ControlField, MARC::Subfield].any? { |t| marc_obj.is_a?(t) }
        end

        protected

        def do_apply(marc_obj)
          value = marc_obj.respond_to?(:value) ? marc_obj.value : marc_obj
          select_from(value)
        end

      end
    end
  end
end
