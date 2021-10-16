require 'marc/spec/queries/al_num_range'
require 'marc/spec/queries/position'
require 'marc/spec/queries/comparison_string'
require 'marc/spec/queries/condition'

require 'marc/spec/queries/character_spec'
require 'marc/spec/queries/indicator_value'
require 'marc/spec/queries/operator'
require 'marc/spec/queries/query'
require 'marc/spec/queries/subfield'
require 'marc/spec/queries/subfield_value'
require 'marc/spec/queries/tag'

module MARC
  module Spec
    module Queries
      module DSL

        def all_c(*c)
          Condition.all_of(*c)
        end

        def any_c(*c)
          Condition.any_of(*c)
        end

        def vfv(sf)
          sf
        end

        def rng(from, to = nil)
          AlNumRange.new(from, to)
        end

        def q(t = nil, s: nil, c: nil, sq: [])
          Query.new(tag: t, selector: s, condition: c, subqueries: sq)
        end

        def pos(p)
          Position.new(p)
        end

        def cstr(s)
          ComparisonString.new(s)
        end

        def c(*args)
          case args.size
          when 2
            Condition.new(args[0], right: args[1])
          when 3
            Condition.new(args[1], left: args[0], right: args[2])
          end
        end

        def cspec(chars)
          # noinspection RubyArgCount
          CharacterSpec.new(chars)
        end

        def indv(ind)
          IndicatorValue.new(ind)
        end

        def sf(code, index = nil)
          Subfield.new(code, index: index)
        end

        def sfv(sf, cspc = nil)
          cspc = cspec(cspc) if cspc.is_a?(PositionOrRange)
          SubfieldValue.new(sf, cspc)
        end

        def tag(t, index = nil)
          Tag.new(t, index)
        end
      end
    end
  end
end
