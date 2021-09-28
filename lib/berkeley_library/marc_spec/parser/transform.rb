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
      end
    end
  end
end
