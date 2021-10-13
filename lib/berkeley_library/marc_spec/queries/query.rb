require 'berkeley_library/marc_spec/parsing/parser'
require 'berkeley_library/marc_spec/queries/part'
require 'berkeley_library/marc_spec/queries/transform'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class Query
        include Part

        attr_reader :tag, :selector, :condition, :subqueries

        def initialize(*args)
          # TODO: explicit subquery class?
          @tag, @selector, @condition, @subqueries = parse_args(args)
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

        private

        def parse_args(args)
          tag = nil
          selector = nil
          condition = nil
          subqueries = []

          args.each do |arg|
            if arg.is_a?(Tag)
              if tag.nil?
                tag = arg
              else
                raise ArgumentError, "Too many tags: #{[tag, arg].map(&:inspect).join(', ')}"
              end
            elsif arg.is_a?(Query)
              subqueries << arg
            elsif arg.is_a?(Condition)
              condition = (condition ? condition.and(arg) : arg)
            elsif arg.is_a?(Selector)
              if selector.nil?
                selector = arg
              else
                raise ArgumentError, "Too many selectors: #{[selector, arg].map(&:inspect).join(', ')}"
              end
            end
          end

          [tag, selector, condition, subqueries]
        end
      end
    end
  end
end
