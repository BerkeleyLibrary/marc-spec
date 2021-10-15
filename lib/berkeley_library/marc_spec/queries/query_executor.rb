require 'marc'
require 'berkeley_library/marc_spec/queries/query'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class QueryExecutor
        include Part

        attr_reader :marc_record, :root_query, :root_tag, :root_fields

        def initialize(marc_record, root, cache = {})
          @marc_record = ensure_type(marc_record, MARC::Record)
          @root_query = as_query(root)
          @cache = cache

          @root_tag = root_query.tag || Tag.new('...')
          @root_fields = apply_tag(root_tag)
        end

        def execute
          root_query.execute(self, root_fields)
        end

        def apply_tag(tag)
          cache[tag] ||= tag.apply(marc_record)
        end

        def apply_selector(selector, field)
          return [field] unless selector

          cache_key = [selector, field]
          cache[cache_key] ||= selector.apply(field)
        end

        def condition_met?(condition, result)
          condition.met?(result, self)
        end

        private

        def as_query(root)
          return root if root.is_a?(Query)
          return Query.new(tag: root) if root.is_a?(Tag)
          raise ArgumentError, "unknown type: #{root.inspect}"
        end

        attr_reader :cache
      end
    end
  end
end
