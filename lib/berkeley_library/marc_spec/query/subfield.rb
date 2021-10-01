require 'stringio'
require 'berkeley_library/marc_spec/query/predicate'

module BerkeleyLibrary
  module MarcSpec
    module Query
      class Subfield
        include Predicate

        # ------------------------------------------------------------
        # Attributes

        attr_reader :code_range, :code, :index, :character_spec

        # ------------------------------------------------------------
        # Initializer

        # TODO: treat code/code range similarly to position_or_range
        def initialize(code_range: nil, code: nil, index: nil, character_spec: nil)
          raise ArgumentError, 'Code or code range must be specified' if [code, code_range].all?(&:nil?)
          raise ArgumentError, 'Code and code range cannot both be specified' if [code, code_range].none?(&:nil?)

          @code_range = code_range
          @code = code
          @index = index
          @character_spec = character_spec
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          StringIO.new.tap do |out|
            out << '$'
            out << (code_range || code)
            out << "[#{index}]" if index
            out << "/#{character_spec}" if character_spec
          end.string
        end

        # ------------------------------------------------------------
        # Predicate

        protected

        def equality_attrs
          %i[code_range code index character_spec]
        end
      end
    end
  end
end
