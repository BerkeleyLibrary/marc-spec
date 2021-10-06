require 'stringio'
require 'berkeley_library/marc_spec/queries/referent'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class Subfield
        include Referent

        # ------------------------------------------------------------
        # Attributes

        attr_reader :code, :index, :character_spec

        # ------------------------------------------------------------
        # Initializer

        def initialize(code, index: nil, character_spec: nil)
          @code = parse_code(code)
          @index = index
          @character_spec = character_spec
        end

        # ------------------------------------------------------------
        # Referent

        def apply(data_field)
          subfields = all_subfields(data_field)
          subfields = index.select_from(subfields) if index
          # TODO: split character_spec into its own object taking
          #       Subfield as a context — cf. Tag/FixedField separation
          return subfields unless character_spec

          subfields.map { |sf| character_spec.select_from(sf.value) }
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          StringIO.new.tap do |out|
            out << '$'
            out << code
            out << "[#{index}]" if index
            out << "/#{character_spec}" if character_spec
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
            out << "/#{character_spec.inspect}" if character_spec
          end.string
        end

        def equality_attrs
          %i[code index character_spec]
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
