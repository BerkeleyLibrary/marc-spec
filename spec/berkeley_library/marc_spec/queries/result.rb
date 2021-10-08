require 'marc'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      # Supermodule of query results
      class Result
      end

      class ArrayResult < Result
        attr_reader :results

        def initialize(result_vals)
          raise ArgumentError, 'Nil result list' if result_vals.nil?
          raise ArgumentError, "Not a result list: #{result_vals}" unless results.respond_to?(:each_with_object)

          @results = result_vals.each_with_object([]) do |rv, results|
            next if rv.nil? || (rv.respond_to?(:empty?) && rv.empty?)
            raise ArgumentError, "Not a result: #{rv}" unless rv.is_a?(Result)

            results << rv
          end
        end

        def empty?
          results.empty?
        end
      end

      class SingleResult < Result
        attr_reader :result

        def initialize(result_val)
          raise ArgumentError, "nil result value: #{result_val.inspect}" if result_val.nil?
          raise ArgumentError, "empty result value: #{result_val.inspect}" if result_val.respond_to?(:empty?) && result_val.empty?

          @result = result_val
        end

        class << self
          def from(result_val)
            self.new(result_val)
          end
        end

        protected

        def valid_value(result_val)
          result_val
        end
      end

      class StringResult < SingleResult
        protected

        def valid_value(result_val)
          result_val.is_a?(String) ? super : raise ArgumentError, "Not a string: #{result_val.inspect}"
        end
      end

      class LeaderResult < StringResult
      end

      class FieldResult < SingleResult
        FIELD_TYPES = [MARC::ControlField, MARC::DataField]

        def valid_value(result_val)
          FIELD_TYPES.any? { |t| result_val.is_a?(t) } ? super : raise ArgumentError, "Not a MARC field: #{result_val.inspect}"
        end
      end


    end
  end
end
