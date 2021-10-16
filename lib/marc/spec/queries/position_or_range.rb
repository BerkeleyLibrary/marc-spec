require 'marc/spec/queries/applicable'

module MARC
  module Spec
    module Queries
      # Marker interface for positions and ranges
      # TODO: unify Position and AlNumRange?
      module PositionOrRange
        include Part

        protected

        def wrap_string_result(result)
          result unless result.nil? || result.empty?
        end

        # NOTE: We can't use `Array()` because we don't want to indiscriminately call `to_ary` / `to_a`
        def wrap_array_result(result)
          return [] unless result
          return result if result.is_a?(Array)

          [result]
        end
      end
    end
  end
end
