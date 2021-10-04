require 'spec_helper'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      describe Transform do

        attr_reader :parser
        attr_reader :xform

        before(:each) do
          @parser = BerkeleyLibrary::MarcSpec::Parsing::Parser.new
          @xform = Transform.new
        end

        # ------------------------------------------------------------
        # Helper methods

        def check_all(expecteds)
          aggregate_failures do
            expecteds.each do |input_str, expected|
              parse_tree = parser.parse(input_str)
              actual = xform.apply(parse_tree)
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
          it 'returns an AlphanumericRange' do
            parse_tree = { from: '11', to: '17' }
            result = xform.apply(parse_tree)
            expect(result).to be_a(AlNumRange)
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
                '856/3-12' => FixedFieldValue.new(
                  Tag.new('856'),
                  AlNumRange.new(3, 12)
                ),
                '856[3]/3-12' => FixedFieldValue.new(
                  Tag.new('856', index: Position.new(3)),
                  AlNumRange.new(3, 12)
                )
              }

              check_all(expecteds)
            end
          end
        end

        describe 'subfieldSpec' do
          describe 'fieldTag w/subfieldSpec' do
            context 'single subfield' do
              it 'returns a VarField' do
                expecteds = {
                  '856$u' => VarFieldValue.new(
                    Tag.new('856'),
                    Subfield.new(code: 'u')
                  ),
                  '856[3]$u' => VarFieldValue.new(
                    Tag.new('856', index: Position.new(3)),
                    Subfield.new(code: 'u')
                  ),
                  '856$u[3]' => VarFieldValue.new(
                    Tag.new('856'),
                    Subfield.new(code: 'u', index: Position.new(3))
                  ),
                  '856$u[3]/1-2' => VarFieldValue.new(
                    Tag.new('856'),
                    Subfield.new(code: 'u', index: Position.new(3), character_spec: AlNumRange.new(1, 2))
                  ),
                  '856$u/1-2' => VarFieldValue.new(
                    Tag.new('856'),
                    Subfield.new(code: 'u', character_spec: AlNumRange.new(1, 2))
                  )
                }

                check_all(expecteds)
              end
            end

            context 'numeric subfield range' do
              it 'returns a VarField' do
                code_range = AlNumRange.new(4, 5)
                range_str = '4-5'

                expecteds = {
                  "856$#{range_str}" => VarFieldValue.new(
                    Tag.new('856'),
                    Subfield.new(code: code_range)
                  ),
                  "856[3]$#{range_str}" => VarFieldValue.new(
                    Tag.new('856', index: Position.new(3)),
                    Subfield.new(code: code_range)
                  ),
                  "856$#{range_str}[3]" => VarFieldValue.new(
                    Tag.new('856'),
                    Subfield.new(code: code_range, index: Position.new(3))
                  ),
                  "856$#{range_str}[3]/1-2" => VarFieldValue.new(
                    Tag.new('856'),
                    Subfield.new(code: code_range, index: Position.new(3), character_spec: AlNumRange.new(1, 2))
                  ),
                  "856$#{range_str}/1-2" => VarFieldValue.new(
                    Tag.new('856'),
                    Subfield.new(code: code_range, character_spec: AlNumRange.new(1, 2))
                  )
                }

                check_all(expecteds)
              end
            end

            context 'alphabetical subfield range' do
              it 'returns a VarField' do
                code_range = AlNumRange.new('d', 'g')
                range_str = 'd-g'

                expecteds = {
                  "856$#{range_str}" => VarFieldValue.new(
                    Tag.new('856'),
                    Subfield.new(code: code_range)
                  ),
                  "856[3]$#{range_str}" => VarFieldValue.new(
                    Tag.new('856', index: Position.new(3)),
                    Subfield.new(code: code_range)
                  ),
                  "856$#{range_str}[3]" => VarFieldValue.new(
                    Tag.new('856'),
                    Subfield.new(code: code_range, index: Position.new(3))
                  ),
                  "856$#{range_str}[3]/1-2" => VarFieldValue.new(
                    Tag.new('856'),
                    Subfield.new(code: code_range, index: Position.new(3), character_spec: AlNumRange.new(1, 2))
                  ),
                  "856$#{range_str}/1-2" => VarFieldValue.new(
                    Tag.new('856'),
                    Subfield.new(code: code_range, character_spec: AlNumRange.new(1, 2))
                  )
                }

                check_all(expecteds)
              end
            end
          end
        end

        describe 'indicatorSpec' do
          describe 'fieldTag w/indicator' do
            it 'returns an Indicator' do
              expecteds = {
                '856^1' => IndicatorValue.new(Tag.new('856'), 1),
                '856[3-#]^2' => IndicatorValue.new(Tag.new('856', index: AlNumRange.new(3, nil)), 2)
              }
              check_all(expecteds)
            end
          end
        end
      end
    end
  end
end
