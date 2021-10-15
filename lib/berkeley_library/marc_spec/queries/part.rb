module BerkeleyLibrary
  module MarcSpec
    module Queries
      # Supermodule of partial query
      module Part

        # ------------------------------------------------------------
        # Object overrides

        def inspect
          "#{cn(self)}<#{to_s_inspect}>"
        end

        def eql?(other)
          return false unless other.class == self.class

          equality_attrs.all? do |attr|
            send(attr) == other.send(attr)
          end
        end

        alias :== eql?

        def hash
          @hash_val ||= begin
            equality_vals = equality_attrs.map { |attr| send(attr) }
            equality_vals.inject(31 + self.class.hash) { |r, v| 31 * r + v.hash }
          end
        end

        # ------------------------------------------------------------
        # Protected methods

        protected

        def to_s_inspect
          to_s
        end

        def append_result(result, results)
          return if result.nil? || result.empty?

          result.is_a?(Array) ? results.concat(result) : results << result
        end

        def wrap_string_result(result)
          result unless result.nil? || result.empty?
        end

        # NOTE: We can't use `Array()` because we don't want to indiscriminately call `to_a`
        def wrap_array_result(result)
          return [] unless result
          return result if result.is_a?(Array)

          [result]
        end

        def ensure_type(v, type, allow_nil: false)
          return if allow_nil && v.nil?
          return v if v.is_a?(type)

          raise ArgumentError, "Not a #{cn(type)}: #{v.inspect}"
        end

        def of_any_type(v, *types, allow_nil: false)
          raise ArgumentError, 'No types specified' if types.nil? || types.empty?
          return nil if allow_nil && v.nil?

          types.each { |t| return v if v.is_a?(t) }
          raise ArgumentError, "Not any of #{cns(types)}.join(', ')}: #{v.inspect}"
        end

        def int_or_nil(v)
          return nil if v.nil? || v == '#'

          Integer(v)
        end

        private

        def cn(t)
          return cn(t.class) unless t.is_a?(Class) || t.is_a?(Module)

          t.name.sub(/^.*::/, '')
        end

        def cns(ts)
          ts.map { |t| cn(t) }
        end
      end
    end
  end
end
