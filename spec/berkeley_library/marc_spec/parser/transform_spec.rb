require 'spec_helper'

module BerkeleyLibrary
  module MarcSpec
    module Parser
      describe Transform do
        include Query

        attr_reader :parser
        attr_reader :xform

        before(:each) do
          @parser = ParserImpl.new
          @xform = Transform.new
        end

        describe :position do
          it 'returns a Position' do
            parse_tree = { pos: '17' }
            result = xform.apply(parse_tree)
            expect(result).to be_a(Query::Position)
            expect(result.position).to eq(17)
          end
        end

        describe 'from/to' do
          it 'returns a Range' do
            parse_tree = { from: '11', to: '17' }
            result = xform.apply(parse_tree)
            expect(result).to be_a(Query::Range)
            expect(result.from).to eq(11)
            expect(result.to).to eq(17)
          end
        end

        describe :field_spec do
          it 'returns a FieldSpec for a plain tag' do
            parse_tree = parser.parse('856')
            result = xform.apply(parse_tree)
            expect(result).to be_a(Query::Fieldspec)
            field_tag = result.tag
            expect(field_tag.tag_re).to eq(/856/)
          end

          it 'returns a FieldSpec for a tag with an index' do
            parse_tree = parser.parse('856[3]')
            result = xform.apply(parse_tree)
            expect(result).to be_a(Query::Fieldspec)

            field_tag = result.tag
            expect(field_tag.tag_re).to eq(/856/)

            index = result.index
            expect(index.position).to eq(3)
          end

          it 'returns a FieldSpec for a tag with a character spec' do
            parse_tree = parser.parse('856/3-12')
            result = xform.apply(parse_tree)
            expect(result).to be_a(Query::Fieldspec)

            field_tag = result.tag
            expect(field_tag.tag_re).to eq(/856/)

            character_spec = result.character_spec
            expect(character_spec).to be_a(Query::Range)
            expect(character_spec.from).to eq(3)
            expect(character_spec.to).to eq(12)
          end

          it 'returns a FieldSpec for a tag with index and character spec' do
            parse_tree = parser.parse('856[3]/3-12')
            result = xform.apply(parse_tree)
            expect(result).to be_a(Query::Fieldspec)

            field_tag = result.tag
            expect(field_tag.tag_re).to eq(/856/)

            index = result.index
            expect(index.position).to eq(3)

            character_spec = result.character_spec
            expect(character_spec).to be_a(Query::Range)
            expect(character_spec.from).to eq(3)
            expect(character_spec.to).to eq(12)
          end
        end

        describe :subfield_spec do
          it 'returns a Subfieldspec for a tag with subfield code' do
            parse_tree = parser.parse('856$u')
            result = xform.apply(parse_tree)
            expect(result).to be_a(Query::Subfieldspec)

            field_tag = result.tag
            expect(field_tag.tag_re).to eq(/856/)

            subfield = result.subfield
            expect(subfield).to be_a(Query::AbrSubfieldspec)
            expect(subfield.code).to eq('u')
          end
        end
      end
    end
  end
end
