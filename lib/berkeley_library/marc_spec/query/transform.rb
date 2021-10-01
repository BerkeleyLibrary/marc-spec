require 'parslet'

module BerkeleyLibrary
  module MarcSpec
    module Query
      class Transform < Parslet::Transform

        # ----------------------------------------
        # Misc. atoms

        rule(pos: simple(:pos)) { Position.new(pos) }

        rule(from: simple(:from), to: simple(:to)) { Range.new(from, to) }

        # ----------------------------------------
        # fieldSpec

        rule(tag: simple(:tag)) do
          Tag.new(tag)
        end

        rule(tag: simple(:tag), index: simple(:index)) do
          Tag.new(tag, index: index)
        end

        # ----------------------------------------
        # fieldSpec (fixed fields)

        rule(tag: simple(:tag), character_spec: simple(:character_spec)) do
          FixedField.new(Tag.new(tag), position_or_range: character_spec)
        end

        rule(tag: simple(:tag), index: simple(:index), character_spec: simple(:character_spec)) do
          FixedField.new(Tag.new(tag, index: index), position_or_range: character_spec)
        end

        # ----------------------------------------
        # subfieldSpec / abrSubfieldSpec

        rule(code: simple(:code)) do
          Subfield.new(code: code)
        end

        rule(code: simple(:code), index: simple(:index)) do
          Subfield.new(code: code, index: index)
        end

        rule(code: simple(:code), character_spec: simple(:character_spec)) do
          Subfield.new(code: code, character_spec: character_spec)
        end

        rule(code: simple(:code), index: simple(:index), character_spec: simple(:character_spec)) do
          Subfield.new(code: code, index: index, character_spec: character_spec)
        end

        rule(code_range: simple(:code_range)) do
          Subfield.new(code_range: code_range)
        end

        rule(code_range: simple(:code_range), index: simple(:index)) do
          Subfield.new(code_range: code_range, index: index)
        end

        rule(code_range: simple(:code_range), character_spec: simple(:character_spec)) do
          Subfield.new(code_range: code_range, character_spec: character_spec)
        end

        rule(code_range: simple(:code_range), index: simple(:index), character_spec: simple(:character_spec)) do
          Subfield.new(code_range: code_range, index: index, character_spec: character_spec)
        end

        rule(tag: simple(:tag), index: simple(:index), subfield: simple(:subfield)) do
          VarField.new(Tag.new(tag, index: index), subfield: subfield)
        end

        rule(tag: simple(:tag), subfield: simple(:subfield)) do
          VarField.new(Tag.new(tag), subfield: subfield)
        end
      end
    end
  end
end