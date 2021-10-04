require 'berkeley_library/marc_spec/query/predicate'

module BerkeleyLibrary
  module MarcSpec
    module Query
      class Tag
        include Predicate

        # ------------------------------------------------------------
        # Attributes

        attr_reader :index, :tag_re, :tag_exact

        # ------------------------------------------------------------
        # Initializer

        def initialize(tag, index: nil)
          raise ArgumentError, 'Tag cannot be nil' unless tag

          @tag_exact = tag.to_s unless (@tag_re = tag_re_from(tag))
          @index = index
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          StringIO.new.tap do |out|
            out << tag_str
            out << "[#{index}]" if index
          end.string
        end

        # ------------------------------------------------------------
        # Predicate

        protected

        def equality_attrs
          %i[tag_str index]
        end

        def to_s_inspect
          StringIO.new.tap do |out|
            out << (tag_re ? tag_re.inspect : tag_exact)
            out << "[#{index}]" if index
          end.string
        end

        # ------------------------------------------------------------
        # Private methods

        private

        def tag_re_from(tag)
          return tag if tag.is_a?(Regexp)

          tag_s = tag.to_s
          Regexp.compile(tag_s) if tag_s.include?('.')
        end

        def tag_str
          @tag_str ||= tag_exact || tag_re.source
        end
      end
    end
  end
end
