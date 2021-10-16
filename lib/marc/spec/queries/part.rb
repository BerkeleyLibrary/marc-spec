module MARC
  module Spec
    module Queries
      # Supermodule of partial query
      module Part

        # ------------------------------------------------------------
        # Object overrides

        def inspect
          "#{class_name(self)}<#{to_s_inspect}>"
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

        def ensure_type(v, type, allow_nil: false)
          return if allow_nil && v.nil?
          return v if v.is_a?(type)

          raise ArgumentError, "Not a #{class_name(type)}: #{v.inspect}"
        end

        def int_or_nil(v)
          return nil if v.nil? || v == '#'

          Integer(v)
        end

        private

        def class_name(t)
          return class_name(t.class) unless t.is_a?(Class) || t.is_a?(Module)

          t.name.sub(/^.*::/, '')
        end
      end
    end
  end
end
