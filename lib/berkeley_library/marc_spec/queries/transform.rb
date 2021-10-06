require 'parslet'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      class Transform < Parslet::Transform

        # ----------------------------------------
        # Misc. atoms

        rule(pos: simple(:pos)) { Position.new(pos) }

        rule(from: simple(:from), to: simple(:to)) { AlNumRange.new(from, to) }

        rule(comparison_string: simple(:string)) { ComparisonString.new(string) }

        rule(character_spec: simple(:character_spec)) { character_spec }

        # ----------------------------------------
        # subTermSet

        rule(left: simple(:left), operator: simple(:operator), right: simple(:right)) do
          Condition.new(operator, left: left, right: right)
        end

        rule(operator: simple(:operator), right: simple(:right)) do
          Condition.new(operator, right: right)
        end

        rule(right: simple(:right)) do
          Condition.new(right: right)
        end

        rule(any_condition: sequence(:conditions)) do
          Condition.any_of(*conditions)
        end

        rule(all_conditions: sequence(:conditions)) do
          Condition.all_of(*conditions)
        end

        # ----------------------------------------
        # fieldSpec

        rule(tag: simple(:tag)) do
          Tag.new(tag)
        end

        rule(tag: simple(:tag), index: simple(:index)) do
          Tag.new(tag, index)
        end

        # ----------------------------------------
        # fieldSpec (fixed fields)

        rule(tag: simple(:tag), character_spec: simple(:character_spec)) do
          FixedFieldValue.new(Tag.new(tag), character_spec)
        end

        rule(tag: simple(:tag), index: simple(:index), character_spec: simple(:character_spec)) do
          FixedFieldValue.new(Tag.new(tag, index), character_spec)
        end

        # ----------------------------------------
        # abrSubfieldSpec

        rule(code: simple(:code)) do
          Subfield.new(code)
        end

        rule(code: simple(:code), index: simple(:index)) do
          Subfield.new(code, index: index)
        end

        rule(code: simple(:code), character_spec: simple(:character_spec)) do
          Subfield.new(code, character_spec: character_spec)
        end

        rule(code: simple(:code), index: simple(:index), character_spec: simple(:character_spec)) do
          Subfield.new(code, index: index, character_spec: character_spec)
        end

        # ----------------------------------------
        # subfieldSpec

        rule(tag: simple(:tag), index: simple(:index), subfield: simple(:subfield)) do
          VarFieldValue.new(Tag.new(tag, index), subfield)
        end

        rule(tag: simple(:tag), subfield: simple(:subfield)) do
          VarFieldValue.new(Tag.new(tag), subfield)
        end

        # ----------------------------------------
        # indicatorSpec

        rule(tag: simple(:tag), index: simple(:index), ind: simple(:ind)) do
          IndicatorValue.new(Tag.new(tag, index), ind)
        end

        rule(tag: simple(:tag), ind: simple(:ind)) do
          IndicatorValue.new(Tag.new(tag), ind)
        end

        # ----------------------------------------
        # MARCSpec

        rule(referent: simple(:referent)) do
          Query.new(referent)
        end

        rule(referent: simple(:referent), condition: simple(:condition)) do
          Query.new(referent, condition)
        end

        rule(referent: simple(:referent), subqueries: sequence(:subqueries)) do
          Query.new(referent, subqueries: subqueries)
        end
      end
    end
  end
end
