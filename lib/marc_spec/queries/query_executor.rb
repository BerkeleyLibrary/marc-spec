require 'marc'
require 'marc_spec/queries/query'

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

      def condition_met?(condition, context_field, context_result)
        cond_ctx = ConditionContext.new(context_field, context_result, self)
        condition.met?(cond_ctx)
      end

      private

      def as_query(root)
        return root if root.is_a?(Query)
        return Query.new(tag: root) if root.is_a?(Tag)
      end

      attr_reader :cache
    end
  end
end
