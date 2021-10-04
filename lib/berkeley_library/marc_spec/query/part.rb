module BerkeleyLibrary
  module MarcSpec
    module Query
      module Part

        # ------------------------------------------------------------
        # Object overrides

        def inspect
          class_name = self.class.name.sub(/^.*::/, '')
          "#{class_name}@#{object_id}<#{to_s_inspect}>"
        end

        def eql?(other)
          return false unless other.class == self.class

          equality_attrs.all? do |attr|
            send(attr) == other.send(attr)
          end
        end

        alias :== eql?

        # ------------------------------------------------------------
        # Protected methods

        protected

        def to_s_inspect
          to_s
        end

        def ensure_type(v, type, allow_nil: false)
          return if allow_nil && v.nil?
          return v if v.is_a?(type)

          raise ArgumentError, "Not a #{type}: #{v.inspect}"
        end

        def select_type(v, left_type, right_type, allow_nil: false)
          return if allow_nil && v.nil?
          return v, nil if v.is_a?(left_type)
          return nil, v if v.is_a?(right_type)

          raise ArgumentError, "Not #{left_type} or #{right_type}: #{v.inspect}"
        end

        def of_any_type(v, *types, allow_nil: false)
          raise ArgumentError, 'No types specified' if types.nil? || types.empty?
          return nil if allow_nil && v.nil?

          types.each { |t| return v if v.is_a?(t) }
          raise ArgumentError, "Not any of #{types.join(', ')}: #{v.inspect}"
        end

        def int_or_nil(v)
          return nil if v.nil? || v == '#'

          Integer(v)
        end
      end
    end
  end
end
