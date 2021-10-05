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
              expect(actual).to eq(expected), -> { failure_msg_for(input_str, actual, expected, parse_tree) }
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
              expect(actual).to eq(expected), -> { failure_msg_for(input_str, actual, expected, parse_tree) }
            end
          end
        end

        def check_queries(expecteds)
          aggregate_failures do
            expecteds.each do |input_str, expected|
              parse_tree = parser.parse(input_str)
              actual = xform.apply(parse_tree)
              expect(actual).to be_a(Query) # just to be sure
              expect(actual).to eq(expected), -> { failure_msg_for(input_str, actual, expected, parse_tree) }
            end
          end
        end

        def failure_msg_for(input_str, actual, expected, parse_tree)
          [
            input_str.inspect,
            "expected:  \t#{expected}",
            "           \t#{expected.inspect}",
            "actual:    \t#{actual}",
            "           \t#{actual.inspect}",
            "parse_tree:\t#{parse_tree}"
          ].join("\n\t")
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
                  '856[3]' => Tag.new('856', Position.new(3))
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
                    Tag.new('856', Position.new(3)),
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
                      Tag.new('856', Position.new(3)),
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
                      Tag.new('856', Position.new(3)),
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
                      Tag.new('856', Position.new(3)),
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
                  '856[3-#]^2' => IndicatorValue.new(Tag.new('856', AlNumRange.new(3, nil)), 2)
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
            let(:vf856u_exist) { Condition.new('?', right: vf856u) }

            let(:vf956u_eq_vf856u) { Condition.new('=', left: vf956u, right: vf856u) }

            # TODO: collapse to one set of expectations
            context 'single subSpec' do
              it 'returns a Query for an implicit unary ?' do
                expecteds = {
                  '956{956$u}' => Query.new(tag956, vf956u_exist),
                  '956^1{956$u}' => Query.new(IndicatorValue.new(tag956, 1), vf956u_exist)
                }
                check_queries(expecteds)
              end

              it 'returns a Query for an explicit unary ?' do
                expecteds = {
                  '956{?956$u}' => Query.new(tag956, vf956u_exist),
                  '956^1{?956$u}' => Query.new(IndicatorValue.new(tag956, 1), vf956u_exist)
                }
                check_queries(expecteds)
              end

              it 'returns a Query for a binary =' do
                expecteds = {
                  '956{956$u=856$u}' => Query.new(tag956, vf956u_eq_vf856u)
                }
                check_queries(expecteds)
              end

              it 'returns a Query for a unary =' do
                expecteds = {
                  '956$u{=856$u}' => Query.new(vf956u, vf956u_eq_vf856u)
                }
                check_queries(expecteds)
              end
            end

            context 'repeated subSpecs' do
              it 'returns a Query' do
                expected_condition = vf956u_exist.and(vf956u_eq_vf856u)
                expected_query = Query.new(vf956u, expected_condition)
                expecteds = {
                  '956$u{?956$u}{956$u=856$u}' => expected_query,
                  '956$u{?956$u}{=856$u}' => expected_query
                }
                check_queries(expecteds)
              end
            end

            context 'chained subTerms' do
              it 'returns a Query' do
                expected_condition = vf856u_exist.or(vf956u_eq_vf856u)
                expected_query = Query.new(vf956u, expected_condition)
                expecteds = {
                  '956$u{?856$u|956$u=856$u}' => expected_query,
                  '956$u{?856$u|=856$u}' => expected_query
                }
                check_queries(expecteds)
              end
            end
          end

          describe 'comparisonString' do
            it 'returns a Query' do
              expecteds = {
                '008/18{LDR/6=\t}' => Query.new(
                  FixedFieldValue.new(Tag.new('008'), Position.new(18)),
                  Condition.new(
                    '=',
                    left: FixedFieldValue.new(Tag.new('LDR'), Position.new(6)),
                    right: ComparisonString.new('t')
                  )
                )
              }
              check_queries(expecteds)
            end
          end
        end

        # ------------------------------------------------------------
        # Examples

        # Examples from https://github.com/MARCspec/MARCspec/blob/v0.16beta/examples.md
        describe 'examples' do
          it 'handles "Reference to field data examples"' do
            examples = {
              'LDR' => Query.new(Tag.new('LDR')),
              '00.' => Query.new(Tag.new('00.')),
              '7..' => Query.new(Tag.new('7..')),
              '100' => Query.new(Tag.new('100'))
            }
            check_queries(examples)
          end

          it 'handles "Reference to field data with repetitions examples"' do
            examples = {
              '300[0]' => Query.new(Tag.new('300', Position.new(0))),
              '300[1]' => Query.new(Tag.new('300', Position.new(1))),
              '300[0-2]' => Query.new(Tag.new('300', AlNumRange.new(0, 2))),
              '300[1-#]' => Query.new(Tag.new('300', AlNumRange.new(1, nil))),
              '300[#]' => Query.new(Tag.new('300', Position.new(nil))),
              '300[#-1]' => Query.new(Tag.new('300', AlNumRange.new(nil, 1)))
            }
            check_queries(examples)
          end

          it 'handles "Reference to substring examples"' do
            examples = {
              'LDR/0-4' => Query.new(FixedFieldValue.new(Tag.new('LDR'), AlNumRange.new(0, 4))),
              'LDR/6' => Query.new(FixedFieldValue.new(Tag.new('LDR'), Position.new(6))),
              '007/0' => Query.new(FixedFieldValue.new(Tag.new('007'), Position.new(0))),
              '007/1-#' => Query.new(FixedFieldValue.new(Tag.new('007'), AlNumRange.new(1, nil))),
              '007/#' => Query.new(FixedFieldValue.new(Tag.new('007'), Position.new(nil))),
              '245$a/#-1' => Query.new(VarFieldValue.new(Tag.new('245'), Subfield.new('a', character_spec: AlNumRange.new(nil, 1))))
            }
            check_queries(examples)
          end

          xit 'handles "Reference to data content examples"' do
            examples = {
              '245$a' => Query.new(VarFieldValue.new(Tag.new('245'), Subfield.new('a'))),
              '245$a$b$c' => nil,
              '245$a-c' => Query.new(VarFieldValue.new(Tag.new('245'), Subfield.new(AlNumRange.new('a', 'c')))),
              '300$_$$' => nil
            }
            check_queries(examples)
          end

          it 'handles "Reference to data content with repetitions examples"' do
            examples = {
              '300[0]$a' => Query.new(VarFieldValue.new(Tag.new('300', Position.new(0)), Subfield.new('a'))),
              '300$a[0]' => Query.new(VarFieldValue.new(Tag.new('300'), Subfield.new('a', index: Position.new(0)))),
              '300$a[#]' => Query.new(VarFieldValue.new(Tag.new('300'), Subfield.new('a', index: Position.new(nil)))),
              '300$a[#-1]' => Query.new(VarFieldValue.new(Tag.new('300'), Subfield.new('a', index: AlNumRange.new(nil, 1))))
            }
            check_queries(examples)
          end

          # TODO: are indicator conditions like this on tags supported?
          xit 'handles "Reference to contextualized data with indicators examples"' do
            examples = {
              '245_1$a' => nil,
              '245_1_$a' => nil,
              '245_10$a' => nil,
              '245__0$a' => nil,
              '307[0-3]_8$a' => nil
            }
            check_queries(examples)
          end

          context '"Reference to contextualized data with subSpecs examples"' do
            it 'handles "Checking dependencies via string comparison"' do
              examples = {
                '008/18{LDR/6=\\t}' => Query.new(
                  FixedFieldValue.new(Tag.new('008'), Position.new(18)),
                  Condition.new('=', left: FixedFieldValue.new(Tag.new('LDR'), Position.new(6)), right: ComparisonString.new('t'))
                ),
                '245$b{007/0=\\a|007/0=\\t}' => Query.new(
                  VarFieldValue.new(Tag.new('245'), Subfield.new('b')),
                  Condition.any_of(
                    Condition.new('=', left: FixedFieldValue.new(Tag.new('007'), Position.new(0)), right: ComparisonString.new('a')),
                    Condition.new('=', left: FixedFieldValue.new(Tag.new('007'), Position.new(0)), right: ComparisonString.new('t'))
                  )
                ),
                '008/18{LDR/6=\\a}{LDR/7=\\a|LDR/7=\\c|LDR/7=\\d|LDR/7=\\m}' => Query.new(
                  FixedFieldValue.new(Tag.new('008'), Position.new(18)),
                  Condition.all_of(
                    Condition.new('=', left: FixedFieldValue.new(Tag.new('LDR'), Position.new(6)), right: ComparisonString.new('a')),
                    Condition.any_of(
                      Condition.new('=', left: FixedFieldValue.new(Tag.new('LDR'), Position.new(7)), right: ComparisonString.new('a')),
                      Condition.new('=', left: FixedFieldValue.new(Tag.new('LDR'), Position.new(7)), right: ComparisonString.new('c')),
                      Condition.new('=', left: FixedFieldValue.new(Tag.new('LDR'), Position.new(7)), right: ComparisonString.new('d')),
                      Condition.new('=', left: FixedFieldValue.new(Tag.new('LDR'), Position.new(7)), right: ComparisonString.new('m'))
                    )
                  )
                )
                # TODO: are indicator conditions like this on tags supported?
                # '880$a{100_1$6~$6/3-5}{100_1$6~\880}' => nil,
              }
              check_queries(examples)
            end

            it 'handles "Checking existence of fields"' do
              examples = {
                '020$c{$a}' => Query.new(
                  VarFieldValue.new(Tag.new('020'), Subfield.new('c')),
                  Condition.new('?', right: Subfield.new('a'))
                ),
                '020$z{!$a}' => Query.new(
                  VarFieldValue.new(Tag.new('020'), Subfield.new('z')),
                  Condition.new('!', right: Subfield.new('a'))
                )
              }
              check_queries(examples)
            end

            # TODO: figure out what's going on here
            xit 'handles "Abbreviation of fieldSpec or subfieldSpec"' do
              examples = {
                '020 ##$a0394170660$qRandom House$c$4.95' => nil,
                '020 ##$a0491001304' => nil,
                '020$q{$c}' => nil,
                '020[0-#]$q[0-#]{$c[0-#]}' => nil,
                '020[0]$q[0]{?020[0]$c[0]} OR // true' => nil,
                '020[1]$q[0]{?020[1]$c[0]} // false' => nil,
                '020 ##$a0394170660$qRandom House$qpaperback$c$4.95' => nil,
                '020 ##$a0394502884$qRandom House$qhardcover$c$12.50 ' => nil,
                '020$c{$q=\paperback}' => nil,
                '020[0-#]$c[0-#]{$q[0-#]=\paperback}' => nil,
                '020[0]$c[0]{020[0]$q[0]=\paperback} OR // false' => nil,
                '020[0]$c[0]{020[0]$q[1]=\paperback} OR // true' => nil,
                '020[1]$c[0]{020[1]$q[0]=\paperback} OR // false' => nil,
                '020[1]$c[0]{020[1]$q[1]=\paperback}    // false' => nil,
                '800[0]{800[0]__1$a~\Poe}' => nil,
                '800[0]{__1$a~\Poe}' => nil,
                '245$a{/#=\/}' => nil,
                '245$a{245$a/#=\/}' => nil
              }
              check_queries(examples)
            end
          end
        end
      end
    end
  end
end
