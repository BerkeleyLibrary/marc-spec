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
          @code = code
          @index = index
          @character_spec = character_spec
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
      end
    end
  end
end
