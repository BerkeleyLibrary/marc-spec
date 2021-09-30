module BerkeleyLibrary
  module MarcSpec
    module Query
      module Part

        # ------------------------------------------------------------
        # Object overrides

        def inspect
          class_name = self.class.name.sub(/^.*::/, '')
          "#{class_name}@#{object_id}<#{self}>"
        end

        def eql?(other)
          return false unless other.class == self.class

          equality_attrs.all? do |attr|
            (send(attr) == other.send(attr)).tap do |eq|
              next if eq

              v0 = send(attr)
              v1 = other.send(attr)
              warn("#{inspect} != #{other.inspect}: #{attr} value #{v0.inspect} != #{v1.inspect}")
            end
          end
        end

        alias :== eql?
      end
    end
  end
end
