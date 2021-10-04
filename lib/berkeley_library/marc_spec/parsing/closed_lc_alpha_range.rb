require 'parslet'

module BerkeleyLibrary
  module MarcSpec
    module Parsing
      class ClosedLcAlphaRange < Parslet::Atoms::Base
        SIMPLE_CLASS_NAME = ClosedLcAlphaRange.name.split('::').last

        LCALPHA_RANGE_RE = /^([a-z])-([a-z])/.freeze

        def try(source, context, _consume_all)
          source_str = source.instance_variable_get(:@str) # TODO: something less hacky
          return context.err(self, source, 'Not a lower-case alphabetic range') unless (range_str = source_str.check(LCALPHA_RANGE_RE))

          s, e = range_str.match(LCALPHA_RANGE_RE)[1, 2]
          return context.err(self, source, "#{s} !<= #{e}") unless s < e

          sv, _, ev = [s.size, 1, e.size].map { |l| source.consume(l) } # discard hyphen
          succ(from: sv, to: ev)
        end

        def to_s_inner(_prec)
          SIMPLE_CLASS_NAME
        end
      end
    end
  end
end
