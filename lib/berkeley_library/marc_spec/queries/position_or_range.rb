require 'berkeley_library/marc_spec/queries/referent'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      module PositionOrRange
        include Referent

        # ------------------------------------------------------------
        # Protected methods

        protected

        # ------------------------------
        # Referent

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
end
