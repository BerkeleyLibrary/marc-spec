require 'berkeley_library/marc_spec/queries/al_num_range'
require 'berkeley_library/marc_spec/queries/position'
require 'berkeley_library/marc_spec/queries/comparison_string'
require 'berkeley_library/marc_spec/queries/condition'

require 'berkeley_library/marc_spec/queries/fixed_field_value'
require 'berkeley_library/marc_spec/queries/indicator_value'
require 'berkeley_library/marc_spec/queries/operator'
require 'berkeley_library/marc_spec/queries/query'
require 'berkeley_library/marc_spec/queries/subfield'
require 'berkeley_library/marc_spec/queries/subfield_value'
require 'berkeley_library/marc_spec/queries/tag'

module BerkeleyLibrary
  module MarcSpec
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
          when 1
            Condition.new(right: args[0])
          when 2
            Condition.new(args[0], right: args[1])
          when 3
            Condition.new(args[1], left: args[0], right: args[2])
          else
            raise ArgumentError, "Too many arguments: #{args}"
          end
        end

        def ffv(chars)
          FixedFieldValue.new(chars)
        end

        def indv(ind)
          IndicatorValue.new(ind)
        end

        # TODO: inline this
        def subfield(code, index = nil)
          return sf(code) unless index

          sf(code, index)
        end

        def sf(code, index = nil)
          Subfield.new(code, index: index)
        end

        def sfv(sf, cspec = nil)
          SubfieldValue.new(sf, cspec)
        end

        def tag(t, index = nil)
          Tag.new(t, index)
        end
      end
    end
  end
end