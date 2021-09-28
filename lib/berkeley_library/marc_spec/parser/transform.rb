require 'parslet'
require 'berkeley_library/marc_spec/query'

module BerkeleyLibrary
  module MarcSpec
    module Parser
      class Transform < Parslet::Transform
        include Query

        # ----------------------------------------
        # Misc. atoms

        rule(pos: simple(:pos)) { Position.new(pos) }

        rule(from: simple(:from), to: simple(:to)) { Range.new(from, to) }

        # ----------------------------------------
        # Fieldspec

        rule(tag: simple(:tag)) do
          Fieldspec.new(tag: FieldTag.new(tag))
        end

        rule(tag: simple(:tag), index: simple(:index)) do
          Fieldspec.new(tag: FieldTag.new(tag), index: index)
        end

        rule(tag: simple(:tag), character_spec: simple(:character_spec)) do
          Fieldspec.new(tag: FieldTag.new(tag), character_spec: character_spec)
        end

        rule(tag: simple(:tag), index: simple(:index), character_spec: simple(:character_spec)) do
          Fieldspec.new(tag: FieldTag.new(tag), index: index, character_spec: character_spec)
        end

        # ----------------------------------------
        # AbrSubfieldspec

        # TODO: merge FieldSpec and SubfieldSpec, rename AbrSubfieldspec

        rule(code: simple(:code)) do
          AbrSubfieldspec.new(code: code)
        end

        rule(code: simple(:code), index: simple(:index)) do
          AbrSubfieldspec.new(code: code, index: index)
        end

        rule(code: simple(:code), character_spec: simple(:character_spec)) do
          AbrSubfieldspec.new(code: code, character_spec: character_spec)
        end

        rule(code: simple(:code), index: simple(:index), character_spec: simple(:character_spec)) do
          AbrSubfieldspec.new(code: code, index: index, character_spec: character_spec)
        end

        rule(code_range: simple(:code_range)) do
          AbrSubfieldspec.new(code_range: code_range)
        end

        rule(code_range: simple(:code_range), index: simple(:index)) do
          AbrSubfieldspec.new(code_range: code_range, index: index)
        end

        rule(code_range: simple(:code_range), character_spec: simple(:character_spec)) do
          AbrSubfieldspec.new(code_range: code_range, character_spec: character_spec)
        end

        rule(code_range: simple(:code_range), index: simple(:index), character_spec: simple(:character_spec)) do
          AbrSubfieldspec.new(code_range: code_range, index: index, character_spec: character_spec)
        end

        # ----------------------------------------
        # Subfieldspec

        rule(tag: simple(:tag), index: simple(:index), subfield: simple(:subfield)) do
          Subfieldspec.new(tag: FieldTag.new(tag), index: index, subfield: subfield)
        end

        rule(tag: simple(:tag), subfield: simple(:subfield)) do
          Subfieldspec.new(tag: FieldTag.new(tag), subfield: subfield)
        end
      end
    end
  end
end
