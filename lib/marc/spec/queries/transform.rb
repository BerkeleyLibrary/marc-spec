require 'parslet'

module MARC
  module Spec
    module Queries
      class Transform < Parslet::Transform

        # ----------------------------------------
        # Misc. atoms

        # { pos: }
        rule(pos: simple(:pos)) { Position.new(pos) }

        # { from:, to: }
        rule(from: simple(:from), to: simple(:to)) { AlNumRange.new(from, to) }

        # { comparison_string: }
        rule(comparison_string: simple(:string)) { ComparisonString.new(string) }

        # { character_spec: }
        rule(character_spec: simple(:character_spec)) do
          # noinspection RubyArgCount
          CharacterSpec.new(character_spec)
        end

        # ----------------------------------------
        # subTermSet

        # { left:, operator:, right: }
        rule(left: simple(:left), operator: simple(:operator), right: simple(:right)) do
          Condition.new(operator, left: left, right: right)
        end

        # { operator:, right: }
        rule(operator: simple(:operator), right: simple(:right)) do
          Condition.new(operator, right: right)
        end

        # { right: }
        rule(right: simple(:right)) do
          Condition.new(right: right)
        end

        # { any_condition: }
        rule(any_condition: sequence(:conditions)) do
          Condition.any_of(*conditions)
        end

        # { all_conditions: }
        rule(all_conditions: sequence(:conditions)) do
          Condition.all_of(*conditions)
        end

        # ----------------------------------------
        # fieldSpec

        # { tag: }
        rule(tag: simple(:tag)) do
          Tag.new(tag)
        end

        # { tag:, index: }
        rule(tag: simple(:tag), index: simple(:index)) do
          Tag.new(tag, index)
        end

        # ----------------------------------------
        # abrSubfieldSpec

        # { code: }
        rule(code: simple(:code)) do
          Subfield.new(code)
        end

        # { code:, index: }
        rule(code: simple(:code), index: simple(:index)) do
          Subfield.new(code, index: index)
        end

        # { code:, sf_chars: }
        rule(code: simple(:code), sf_chars: simple(:sf_chars)) do
          SubfieldValue.new(Subfield.new(code), sf_chars)
        end

        # { code:, index:, sf_chars: }
        rule(code: simple(:code), index: simple(:index), sf_chars: simple(:sf_chars)) do
          SubfieldValue.new(Subfield.new(code, index: index), sf_chars)
        end

        # ----------------------------------------
        # indicatorSpec

        # { ind: }
        rule(ind: simple(:ind)) do
          IndicatorValue.new(ind)
        end

        # ----------------------------------------
        # subSpec

        # TODO: separate Subquery type?

        # { selector: }
        rule(selector: simple(:selector)) do
          Query.new(selector: selector)
        end

        # { selector:, condition: }
        rule(selector: simple(:selector), condition: simple(:condition)) do
          Query.new(selector: selector, condition: condition)
        end

        # ----------------------------------------
        # MARCSpec

        # { tag:, selector: }
        rule(tag: simple(:tag), selector: simple(:selector)) do
          Query.new(tag: Tag.new(tag), selector: selector)
        end

        # { tag:, index:, selector: }
        rule(tag: simple(:tag), index: simple(:index), selector: simple(:selector)) do
          Query.new(tag: Tag.new(tag, index), selector: selector)
        end

        # { tag:, condition: }
        rule(tag: simple(:tag), condition: simple(:condition)) do
          Query.new(tag: Tag.new(tag), condition: condition)
        end

        # { tag:, index:, condition: }
        rule(tag: simple(:tag), index: simple(:index), condition: simple(:condition)) do
          Query.new(tag: Tag.new(tag, index), condition: condition)
        end

        # { tag:, subqueries: }
        rule(tag: simple(:tag), subqueries: sequence(:subqueries)) do
          Query.new(tag: Tag.new(tag), subqueries: subqueries)
        end

        # { tag:, selector:, condition: }
        rule(tag: simple(:tag), selector: simple(:selector), condition: simple(:condition)) do
          Query.new(tag: Tag.new(tag), selector: selector, condition: condition)
        end

        # { tag:, index:, selector:, condition: }
        rule(tag: simple(:tag), index: simple(:index), selector: simple(:selector), condition: simple(:condition)) do
          Query.new(tag: Tag.new(tag, index), selector: selector, condition: condition)
        end

      end
    end
  end
end
