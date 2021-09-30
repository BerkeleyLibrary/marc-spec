require 'berkeley_library/marc_spec/query/predicate'

module BerkeleyLibrary
  module MarcSpec
    module Query
      class Tag
        include Predicate

        # ------------------------------------------------------------
        # Attributes

        attr_reader :index

        # ------------------------------------------------------------
        # Initializer

        def initialize(tag, index: nil)
          @tag = tag.to_s
          @index = index
        end

        # ------------------------------------------------------------
        # Synthetic accessors

        def tag_re
          return @tag_re if instance_variable_defined?(:@tag_re)
          return (@tag_re = nil) unless wildcard?

          @tag_re = Regexp.compile(@tag)
        end

        def tag_exact
          return @tag_exact if instance_variable_defined?(:@tag_exact)
          return (@tag_exact = nil) if wildcard?

          @tag_exact = @tag
        end

        # ------------------------------------------------------------
        # Object overrides

        def to_s
          StringIO.new.tap do |out|
            out << tag
            out << "[#{index}]" if index
          end.string
        end

        # ------------------------------------------------------------
        # Predicate

        protected

        def equality_attrs
          %i[tag index]
        end

        # ------------------------------------------------------------
        # Private methods

        private

        attr_reader :tag

        def wildcard?
          tag.include?('.')
        end

      end
    end
  end
end
