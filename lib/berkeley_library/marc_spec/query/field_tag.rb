module BerkeleyLibrary
  module MarcSpec
    module Query
      class FieldTag

        attr_reader :tag_re

        def initialize(tag_spec)
          @tag_re = ensure_regexp(tag_spec)
        end

        private

        def ensure_regexp(tag_spec)
          return tag_spec if tag_spec.is_a?(Regexp)

          Regexp.compile(tag_spec)
        end
      end
    end
  end
end
