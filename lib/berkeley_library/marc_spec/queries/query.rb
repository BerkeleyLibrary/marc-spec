require 'berkeley_library/marc_spec/parsing/parser'
require 'berkeley_library/marc_spec/queries/part'
require 'berkeley_library/marc_spec/queries/transform'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class Query
        include Part

        attr_reader :tag, :selector, :condition, :subqueries

        def initialize(tag: nil, selector: nil, condition: nil, subqueries: [])
          @tag = ensure_type(tag, Tag, allow_nil: true)
          @selector = ensure_type(selector, Selector, allow_nil: true)
          @condition = ensure_type(condition, Condition, allow_nil: true)
          @subqueries = subqueries.map { |sq| ensure_type(sq, Query) }
        end

        def to_s
          [tag, selector, condition, subqueries].compact.join
        end

        protected

        def equality_attrs
          [:tag, :selector, :condition, :subqueries]
        end

        def to_s_inspect
          StringIO.new.tap do |out|
            out << tag.inspect if tag
            out << selector.inspect if selector
            out << "{#{condition.inspect}}" if condition
            out << subqueries.map { |sq| sq.inspect }.join(', ') unless subqueries.empty?
          end.string
        end

      end
    end
  end
end
