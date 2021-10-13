require 'berkeley_library/marc_spec/queries/position_or_range'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class AlNumRange
        include PositionOrRange

        # ------------------------------------------------------------
        # Attributes

        attr_reader :from, :to

        # ------------------------------------------------------------
        # Initializer

        def initialize(from, to)
          @from, @to = parse_endpoints(from, to)
        end

        # ------------------------------------------------------------
        # Instance methods

        def select_from(seq)
          raw_result = select_raw_from(seq)
          seq.is_a?(String) ? wrap_string_result(raw_result) : raw_result
        end

        def include?(v)
          return false if empty?
          return (v < 0 && v > reverse_endpoint) if from.nil?
          return false if v < from

          to.nil? ? true : v <= to
        end

        def alphabetic?
          lc_alpha?(from) || lc_alpha?(to)
        end

        def empty?
          from.nil? && to.nil?
        end

        def index_range
          @index_range ||= to_range
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          "#{from || '#'}-#{to || '#'}"
        end

        # ------------------------------------------------------------
        # Part

        protected

        def equality_attrs
          %i[from to]
        end

        private

        def select_raw_from(seq)
          return seq if from == 0 && to.nil?
          return seq[index_range] unless alphabetic?
          return select_raw_from(seq.chars).join if seq.respond_to?(:chars)
          raise ArgumentError, "Can't select from non-sequence #{seq.inspect}" unless seq.respond_to?(:select)

          seq.select { |x| include?(x) }
        end

        def reverse_endpoint
          -(1 + to)
        end

        def to_range
          return (0..-1) if empty?
          return (reverse_endpoint..) if from.nil?

          (from..to) # OK for to to be nil here
        end

        def parse_endpoints(from, to)
          original_values = [from, to]
          if original_values.all? { |p| lc_alpha?(p) }
            original_values.map(&:to_s)
          else
            original_values.map { |p| int_or_nil(p) }
          end
        end

        def lc_alpha?(endpoint)
          endpoint_str = endpoint.to_s
          endpoint_str.size == 1 &&
            endpoint_str.ord >= 'a'.ord &&
            endpoint_str.ord <= 'z'.ord
        end
      end
    end
  end
end
