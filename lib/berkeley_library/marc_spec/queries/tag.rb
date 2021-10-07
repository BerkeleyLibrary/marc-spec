require 'marc'
require 'berkeley_library/marc_spec/queries/referent'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class Tag
        include Referent

        # ------------------------------------------------------------
        # Constants

        LDR = 'LDR'.freeze

        # ------------------------------------------------------------
        # Attributes

        attr_reader :index, :tag_re, :tag_exact

        # ------------------------------------------------------------
        # Initializer

        def initialize(tag, index = nil)
          raise ArgumentError, 'Tag cannot be nil' unless tag

          @tag_exact = tag.to_s unless (@tag_re = tag_re_from(tag))
          @index = position_or_range(index, allow_nil: true)
        end

        # ------------------------------------------------------------
        # Referent

        def apply(marc_record)
          all_fields = all_fields(marc_record)
          index ? index.select_from(all_fields) : all_fields
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
            out << "[#{index.inspect}]" if index
          end.string
        end

        # ------------------------------------------------------------
        # Private methods

        private

        def all_fields(marc_record)
          return [marc_record.leader] if tag_exact == LDR
          return marc_record.fields(tag_exact) if tag_exact

          [].tap do |ff|
            ff << marc_record.leader if LDR =~ tag_re
            marc_record.each { |field| ff << field if field.tag =~ tag_re }
          end
        end

        def tag_re_from(tag)
          return tag if tag.is_a?(Regexp)

          tag_s = tag.to_s
          Regexp.compile("^#{tag_s}$") if tag_s.include?('.')
        end

        def tag_str
          @tag_str ||= tag_exact || tag_re.source
        end
      end
    end
  end
end
