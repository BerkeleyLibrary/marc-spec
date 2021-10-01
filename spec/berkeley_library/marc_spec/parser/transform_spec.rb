require 'spec_helper'

module BerkeleyLibrary
  module MarcSpec
    module Query
      describe Transform do

        attr_reader :parser
        attr_reader :xform

        before(:each) do
          @parser = BerkeleyLibrary::MarcSpec::Parser::ParserImpl.new
          @xform = Transform.new
        end

        # ------------------------------------------------------------
        # Helper methods

        def check_all(expecteds)
          aggregate_failures do
            expecteds.each do |input_str, expected|
              parse_tree = parser.parse(input_str)
              actual = xform.apply(parse_tree)
              if actual != expected
                puts 'oops'
              end
              expect(actual).to eq(expected), "Expected #{expected.inspect} for #{input_str.inspect}, got #{actual.inspect}"
            end
          end
        end

        # ------------------------------------------------------------
        # Atoms

        describe :position do
          it 'returns a Position' do
            parse_tree = { pos: '17' }
            result = xform.apply(parse_tree)
            expect(result).to be_a(Position)
            expect(result.position).to eq(17)
          end
        end

        describe 'from/to' do
          it 'returns a Range' do
            parse_tree = { from: '11', to: '17' }
            result = xform.apply(parse_tree)
            expect(result).to be_a(Range)
            expect(result.from).to eq(11)
            expect(result.to).to eq(17)
          end
        end

        # ------------------------------------------------------------
        # Complete queries

        describe 'fieldSpec' do
          describe 'fieldTag' do
            it 'returns a Tag' do
              expecteds = {
                '856' => Tag.new('856'),
                '.56' => Tag.new('.56'),
                '856[3]' => Tag.new('856', index: Position.new(3))
              }
              check_all(expecteds)
            end
          end

          describe 'fieldTag w/characterSpec' do
            it 'returns a FixedField' do
              expecteds = {
                '856/3-12' => FixedField.new(
                  Tag.new('856'),
                  position_or_range: Range.new(3, 12)
                ),
                '856[3]/3-12' => FixedField.new(
                  Tag.new('856', index: Position.new(3)),
                  position_or_range: Range.new(3, 12)
                )
              }

              check_all(expecteds)
            end
          end

          describe 'fieldTag w/subfieldSpec' do
            it 'returns a VarField' do
              expecteds = {
                '856$u' => VarField.new(
                  Tag.new('856'),
                  subfield: Subfield.new(code: 'u')
                ),
                '856[3]$u' => VarField.new(
                  Tag.new('856', index: Position.new(3)),
                  subfield: Subfield.new(code: 'u')
                ),
                '856$u[3]' => VarField.new(
                  Tag.new('856'),
                  subfield: Subfield.new(code: 'u', index: Position.new(3))
                ),
                '856$u[3]/1-2' => VarField.new(
                  Tag.new('856'),
                  subfield: Subfield.new(code: 'u', index: Position.new(3), character_spec: Range.new(1, 2))
                ),
                # TODO: parse code ranges to an object
                '856$4-5' => VarField.new(
                  Tag.new('856'),
                  subfield: Subfield.new(code: '4-5')
                ),
                '856[3]$4-5' => VarField.new(
                  Tag.new('856', index: Position.new(3)),
                  subfield: Subfield.new(code: '4-5')
                ),
                '856$4-5[3]' => VarField.new(
                  Tag.new('856'),
                  subfield: Subfield.new(code_range: '4-5', index: Position.new(3))
                ),
                '856$4-5[3]/1-2' => VarField.new(
                  Tag.new('856'),
                  subfield: Subfield.new(code_range: '4-5', index: Position.new(3), character_spec: Range.new(1, 2))
                )

              }

              check_all(expecteds)
            end
          end
        end
      end
    end
  end
end
