require 'berkeley_library/marc_spec/queries/part'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class Query
        include Part

        attr_reader :referent
        attr_reader :condition

        def initialize(referent, condition)
          raise ArgumentError, 'referent cannot be nil' unless referent

          @referent = referent
          @conditions = condition
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          StringIO.new.tap do |out|
            out << referent
            out << "{#{condition}}" if condition
          end.string
        end

        # ------------------------------------------------------------
        # Protected methods

        protected

        def to_s_inspect
          StringIO.new.tap do |out|
            out << referent.inspect
            out << "{#{condition.inspect}}"
          end.string
        end

        def equality_attrs
          %i[referent condition]
        end
      end
    end
  end
end
