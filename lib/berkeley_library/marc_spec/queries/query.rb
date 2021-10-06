require 'berkeley_library/marc_spec/queries/part'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class Query
        include Part

        attr_reader :referent
        attr_reader :condition
        attr_reader :subqueries

        def initialize(referent, condition = nil, subqueries: [])
          raise ArgumentError, 'referent cannot be nil' unless referent

          @referent = ensure_type(referent, Referent)
          @condition = condition.tap { |c| c.implicit_left = referent if c }
          @subqueries = ensure_type(subqueries, Array)
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          StringIO.new.tap do |out|
            out << referent
            out << "{#{condition}}" if condition
            out << subqueries.join.to_s unless subqueries.empty?
          end.string
        end

        # ------------------------------------------------------------
        # Protected methods

        protected

        def to_s_inspect
          StringIO.new.tap do |out|
            out << referent.inspect
            out << "{#{condition.inspect}}" if condition
            out << subqueries.map(&:inspect).to_s unless subqueries.empty?
          end.string
        end

        def equality_attrs
          %i[referent condition subqueries]
        end

      end
    end
  end
end
