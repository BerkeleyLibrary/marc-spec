require 'marc'
require 'marc/spec/queries/query'

module MARC
  module Spec
    module Queries
      class QueryExecutor
        include Part

        attr_reader :marc_record, :root_query

        def initialize(marc_record, root_query, cache = {})
          @marc_record = ensure_type(marc_record, MARC::Record)
          @root_query = root_query
          @cache = cache
        end

        def root_tag
          @root_tag ||= root_query.tag || Tag.new('...')
        end

        def root_fields
          @root_fields ||= apply_tag(root_tag)
        end

        def execute
          root_query.execute(self, root_fields)
        end

        def any_results?
          root_query.any_results?(self, root_fields)
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

        attr_reader :cache
      end
    end
  end
end
