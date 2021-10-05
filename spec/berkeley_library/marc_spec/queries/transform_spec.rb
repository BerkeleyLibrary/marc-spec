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

        def check_referents(expecteds)
          aggregate_failures do
            expecteds.each do |input_str, expected|
              parse_tree = parser.parse(input_str)
              query = xform.apply(parse_tree)
              expect(query).to be_a(Query) # just to be sure
              actual = query.referent
              expect(actual).to eq(expected), "Expected referent: #{expected.inspect} for #{input_str.inspect}, got #{actual.inspect}; parse tree was: #{parse_tree}"
            end
          end
        end

        def check_conditions(expecteds)
          aggregate_failures do
            expecteds.each do |input_str, expected|
              parse_tree = parser.parse(input_str)
              query = xform.apply(parse_tree)
              expect(query).to be_a(Query) # just to be sure
              actual = query.condition
              expect(actual).to eq(expected), "Expected condition: #{expected.inspect} for #{input_str.inspect}, got #{actual.inspect}; parse tree was: #{parse_tree}"
            end
          end
        end

        def check_queries(expecteds)
          aggregate_failures do
            expecteds.each do |input_str, expected|
              parse_tree = parser.parse(input_str)
              actual = xform.apply(parse_tree)
              expect(actual).to be_a(Query) # just to be sure
              expect(actual).to eq(expected), "Expected #{expected.inspect} for #{input_str.inspect}, got #{actual.inspect}; parse tree was: #{parse_tree}"
            end
          end
        end

        # ------------------------------------------------------------
        # Atoms

        describe 'position atom' do
          it 'returns a Position' do
            parse_tree = { pos: '17' }
            result = xform.apply(parse_tree)
            expect(result).to be_a(Position)
            expect(result.position).to eq(17)
          end
        end

        describe 'range atom' do
          it 'returns an AlphanumericRange' do
            parse_tree = { from: '11', to: '17' }
            result = xform.apply(parse_tree)
            expect(result).to be_a(AlNumRange)
            expect(result.from).to eq(11)
            expect(result.to).to eq(17)
          end
        end

        describe 'condition atom' do
          it 'returns a Condition' do
            parse_tree = { left: nil, operator: '?', right: { tag: '956' } }
            result = xform.apply(parse_tree)
            expect(result).to be_a(Condition)
            expect(result.left).to be_nil
            expect(result.operator).to eq('?')
            expect(result.right).to eq(Tag.new('956'))
          end
        end

        # ------------------------------------------------------------
        # Referents

        describe 'referents' do

          describe 'fieldSpec' do
            describe 'fieldTag' do
              it 'returns a Tag' do
                expecteds = {
                  '856' => Tag.new('856'),
                  '.56' => Tag.new('.56'),
                  '856[3]' => Tag.new('856', index: Position.new(3))
                }
                check_referents(expecteds)
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

                check_referents(expecteds)
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
                      Subfield.new('u')
                    ),
                    '856[3]$u' => VarFieldValue.new(
                      Tag.new('856', index: Position.new(3)),
                      Subfield.new('u')
                    ),
                    '856$u[3]' => VarFieldValue.new(
                      Tag.new('856'),
                      Subfield.new('u', index: Position.new(3))
                    ),
                    '856$u[3]/1-2' => VarFieldValue.new(
                      Tag.new('856'),
                      Subfield.new('u', index: Position.new(3), character_spec: AlNumRange.new(1, 2))
                    ),
                    '856$u/1-2' => VarFieldValue.new(
                      Tag.new('856'),
                      Subfield.new('u', character_spec: AlNumRange.new(1, 2))
                    )
                  }

                  check_referents(expecteds)
                end
              end

              context 'numeric subfield range' do
                it 'returns a VarField' do
                  code_range = AlNumRange.new(4, 5)
                  range_str = '4-5'

                  expecteds = {
                    "856$#{range_str}" => VarFieldValue.new(
                      Tag.new('856'),
                      Subfield.new(code_range)
                    ),
                    "856[3]$#{range_str}" => VarFieldValue.new(
                      Tag.new('856', index: Position.new(3)),
                      Subfield.new(code_range)
                    ),
                    "856$#{range_str}[3]" => VarFieldValue.new(
                      Tag.new('856'),
                      Subfield.new(code_range, index: Position.new(3))
                    ),
                    "856$#{range_str}[3]/1-2" => VarFieldValue.new(
                      Tag.new('856'),
                      Subfield.new(code_range, index: Position.new(3), character_spec: AlNumRange.new(1, 2))
                    ),
                    "856$#{range_str}/1-2" => VarFieldValue.new(
                      Tag.new('856'),
                      Subfield.new(code_range, character_spec: AlNumRange.new(1, 2))
                    )
                  }

                  check_referents(expecteds)
                end
              end

              context 'alphabetical subfield range' do
                it 'returns a VarField' do
                  code_range = AlNumRange.new('d', 'g')
                  range_str = 'd-g'

                  expecteds = {
                    "856$#{range_str}" => VarFieldValue.new(
                      Tag.new('856'),
                      Subfield.new(code_range)
                    ),
                    "856[3]$#{range_str}" => VarFieldValue.new(
                      Tag.new('856', index: Position.new(3)),
                      Subfield.new(code_range)
                    ),
                    "856$#{range_str}[3]" => VarFieldValue.new(
                      Tag.new('856'),
                      Subfield.new(code_range, index: Position.new(3))
                    ),
                    "856$#{range_str}[3]/1-2" => VarFieldValue.new(
                      Tag.new('856'),
                      Subfield.new(code_range, index: Position.new(3), character_spec: AlNumRange.new(1, 2))
                    ),
                    "856$#{range_str}/1-2" => VarFieldValue.new(
                      Tag.new('856'),
                      Subfield.new(code_range, character_spec: AlNumRange.new(1, 2))
                    )
                  }

                  check_referents(expecteds)
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
                check_referents(expecteds)
              end
            end
          end

        end

        # ------------------------------------------------------------
        # Conditions

        describe 'conditions' do
          describe 'subSpec' do
            describe 'unary condition' do
              it 'returns a Condition' do
                expecteds = {
                  '...{?956}' => Condition.new('?', right: Tag.new('956'))
                }
                check_conditions(expecteds)
              end
            end
          end

        end

        # ------------------------------------------------------------
        # Complete queries

        describe 'queries' do
          describe 'subSpec' do
            let(:tag956) { Tag.new('956') }
            let(:vf956u) { VarFieldValue.new(tag956, Subfield.new('u')) }
            let(:vf956u_exist) { Condition.new('?', right: vf956u) }

            let(:tag856) { Tag.new('856') }
            let(:vf856u) { VarFieldValue.new(tag856, Subfield.new('u')) }

            context 'single subTerm' do
              it 'returns a Query for an implicit unary ?' do
                expecteds = {
                  '956{956$u}' => Query.new(tag956, vf956u_exist),
                  '956^1{956$u}' => Query.new(IndicatorValue.new(tag956, 1), vf956u_exist),
                }
                check_queries(expecteds)
              end

              it 'returns a Query for an explicit unary ?' do
                expecteds = {
                  '956{?956$u}' => Query.new(tag956, vf956u_exist),
                  '956^1{?956$u}' => Query.new(IndicatorValue.new(tag956, 1), vf956u_exist),
                }
                check_queries(expecteds)
              end

              it 'returns a Query for a binary =' do
                vf956u_eq_vf856u = Condition.new('=', left: vf956u, right: vf856u)

                expecteds = {
                  '956{956$u=856$u}' => Query.new(tag956, vf956u_eq_vf856u),
                }
                check_queries(expecteds)
              end

              it 'returns a Query for a unary =' do
                vf956u_eq_vf856u = Condition.new('=', left: vf956u, right: vf856u)

                expecteds = {
                  '956$u{=856$u}' => Query.new(vf956u, vf956u_eq_vf856u),
                }
                check_queries(expecteds)
              end
            end
          end
        end
      end
    end
  end
end
