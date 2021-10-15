require 'stringio'
require 'marc_spec/queries/selector'

module MarcSpec
  module Queries
    class Subfield
      include Selector

      # ------------------------------------------------------------
      # Attributes

      attr_reader :code, :index

      # ------------------------------------------------------------
      # Initializer

      def initialize(code, index: nil)
        @code = parse_code(code)
        @index = ensure_type(index, PositionOrRange, allow_nil: true)
      end

      # ------------------------------------------------------------
      # Object overrides

      def to_s
        StringIO.new.tap do |out|
          out << '$'
          out << code
          out << "[#{index}]" if index
        end.string
      end

      # ------------------------------
      # Applicable

      def can_apply?(marc_obj)
        marc_obj.respond_to?(:subfields)
      end

      # ------------------------------------------------------------
      # Protected methods

      protected

      # ------------------------------
      # Applicable

      def do_apply(data_field)
        subfields = all_subfields(data_field)
        raw_result = index ? index.select_from(subfields) : subfields
        Array(raw_result)
      end

      # ------------------------------
      # Predicate

      def to_s_inspect
        StringIO.new.tap do |out|
          out << '$'
          out << code.inspect
          out << "[#{index.inspect}]" if index
        end.string
      end

      def equality_attrs
        %i[code index]
      end

      # ------------------------------------------------------------
      # Private methods

      private

      def all_subfields(data_field)
        data_field.subfields.select { |sf| code.include?(sf.code) }
      end

      def parse_code(code)
        raise ArgumentError, 'Code cannot be nil' if code.nil?

        code.is_a?(AlNumRange) ? code : code.to_s
      end

    end
  end
end
