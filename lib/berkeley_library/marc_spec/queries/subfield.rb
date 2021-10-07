require 'stringio'
require 'berkeley_library/marc_spec/queries/referent'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class Subfield
        include Referent

        # ------------------------------------------------------------
        # Attributes

        attr_reader :code, :index

        # ------------------------------------------------------------
        # Initializer

        def initialize(code, index: nil)
          @code = parse_code(code)
          @index = position_or_range(index, allow_nil: true)
        end

        # ------------------------------------------------------------
        # Referent

        def apply(data_field)
          subfields = all_subfields(data_field)
          index ? index.select_from(subfields) : subfields
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

        # ------------------------------------------------------------
        # Predicate

        protected

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
end
