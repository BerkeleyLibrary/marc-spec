require 'spec_helper'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      describe Transform do

        attr_reader :parser
        attr_reader :xform

        before(:each) do
          @parser = Parsing::Parser.new
          @xform = Transform.new
        end

        # TODO: just create a DSL
        tag_856 = Tag.new('856')
        sf_u = Subfield.new('u')

        range_3_12 = AlNumRange.new(3, 12)
        range_1_2 = AlNumRange.new(1, 2)
        range_0_2 = AlNumRange.new(0, 2)

        ind2 = IndicatorValue.new(2)
        ind1 = IndicatorValue.new(1)

        pos_0 = Position.new(0)
        pos_1 = Position.new(1)
        pos_3 = Position.new(3)
        pos_6 = Position.new(6)

        # ------------------------------------------------------------
        # Helper methods

        def check_all(expecteds)
          aggregate_failures do
            expecteds.each do |input_str, expected|
              parse_tree = parser.parse(input_str)
              actual = xform.apply(parse_tree)
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
            expect(result.operator).to eq(Operator::EXIST)
            expect(result.right).to eq(Tag.new('956'))
          end
        end

        # ------------------------------------------------------------
        # Applicables

        describe 'applicables' do

          describe 'fieldSpec' do
            describe 'fieldTag' do
              it 'returns a Tag' do
                expecteds = {
                  '856' => tag_856,
                  '.56' => Tag.new('.56'),
                  '856[3]' => Tag.new('856', pos_3)
                }
                check_all(expecteds)
              end
            end

            describe 'fieldTag w/characterSpec' do
              it 'returns a FixedField' do
                expecteds = {
                  '856/3-12' => Query.new(tag_856, FixedFieldValue.new(range_3_12)),
                  '856[3]/3-12' => Query.new(Tag.new('856', pos_3), FixedFieldValue.new(range_3_12))
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
                    '856$u' => Query.new(tag_856, VarFieldValue.new(sf_u)),
                    '856[3]$u' => Query.new(Tag.new('856', pos_3), VarFieldValue.new(sf_u)),
                    '856$u[3]' => Query.new(tag_856, VarFieldValue.new(Subfield.new('u', index: pos_3))),
                    '856$u[3]/1-2' => Query.new(tag_856, VarFieldValue.new(SubfieldValue.new(Subfield.new('u', index: pos_3), range_1_2))),
                    '856$u/1-2' => Query.new(tag_856, VarFieldValue.new(SubfieldValue.new(sf_u, range_1_2)))
                  }

                  check_all(expecteds)
                end
              end

              context 'numeric subfield range' do
                it 'returns a VarField' do
                  code_range = AlNumRange.new(4, 5)
                  sf_4_5 = Subfield.new(code_range)
                  vf_4_5 = VarFieldValue.new(sf_4_5)
                  range_str = '4-5'

                  sf_4_5_pos_3 = Subfield.new(code_range, index: pos_3)

                  expecteds = {
                    "856$#{range_str}" => Query.new(tag_856, vf_4_5),
                    "856[3]$#{range_str}" => Query.new(Tag.new('856', pos_3), vf_4_5),
                    "856$#{range_str}[3]" => Query.new(tag_856, VarFieldValue.new(sf_4_5_pos_3)),
                    "856$#{range_str}[3]/1-2" => Query.new(tag_856, VarFieldValue.new(SubfieldValue.new(sf_4_5_pos_3, range_1_2))),
                    "856$#{range_str}/1-2" => Query.new(tag_856, VarFieldValue.new(SubfieldValue.new(sf_4_5, range_1_2)))
                  }

                  check_all(expecteds)
                end
              end

              context 'alphabetical subfield range' do
                it 'returns a VarField' do
                  code_range = AlNumRange.new('d', 'g')
                  sf_d_g = Subfield.new(code_range)
                  range_str = 'd-g'

                  sf_d_g_pos_3 = Subfield.new(code_range, index: pos_3)
                  vf_d_g = VarFieldValue.new(sf_d_g)

                  expecteds = {
                    "856$#{range_str}" => Query.new(tag_856, vf_d_g),
                    "856[3]$#{range_str}" => Query.new(Tag.new('856', pos_3), vf_d_g),
                    "856$#{range_str}[3]" => Query.new(tag_856, VarFieldValue.new(sf_d_g_pos_3)),
                    "856$#{range_str}[3]/1-2" => Query.new(tag_856, VarFieldValue.new(SubfieldValue.new(sf_d_g_pos_3, range_1_2))),
                    "856$#{range_str}/1-2" => Query.new(tag_856, VarFieldValue.new(SubfieldValue.new(sf_d_g, range_1_2)))
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
                  '856^1' => Query.new(tag_856, ind1),
                  '856[3-#]^2' => Query.new(Tag.new('856', AlNumRange.new(3, nil)), ind2)
                }
                check_all(expecteds)
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
                  '...{?956}' => Query.new(Tag.new('...'), Condition.new('?', right: Tag.new('956')))
                }
                check_all(expecteds)
              end
            end
          end

        end

        # ------------------------------------------------------------
        # Complete queries

        describe 'queries' do
          describe 'subSpec' do
            vfv_sfu = VarFieldValue.new(Subfield.new('u'))
            let(:tag956) { Tag.new('956') }
            let(:vf956u) { Query.new(tag956, vfv_sfu) }
            let(:vf956u_exist) { Condition.new('?', right: vf956u) }

            let(:tag856) { tag_856 }
            let(:vf856u) { Query.new(tag856, vfv_sfu) }
            let(:vf856u_exist) { Condition.new('?', right: vf856u) }

            let(:vf956u_eq_vf856u) { Condition.new('=', left: vf956u, right: vf856u) }

            # TODO: handle implicit left during transform?
            let(:implicit_eq_vf856u) { Condition.new('=', right: vf856u) }

            ind1 = ind1

            # TODO: collapse to one set of expectations
            context 'single subSpec' do
              it 'returns a Query for an implicit unary ?' do
                expecteds = {
                  '956{956$u}' => Query.new(tag956, vf956u_exist),
                  '956^1{956$u}' => Query.new(tag956, ind1, vf956u_exist)
                }
                check_all(expecteds)
              end

              it 'returns a Query for an explicit unary ?' do
                expecteds = {
                  '956{?956$u}' => Query.new(tag956, vf956u_exist),
                  '956^1{?956$u}' => Query.new(tag956, ind1, vf956u_exist)
                }
                check_all(expecteds)
              end

              it 'returns a Query for a binary =' do
                expecteds = {
                  '956{956$u=856$u}' => Query.new(tag956, vf956u_eq_vf856u)
                }
                check_all(expecteds)
              end

              it 'returns a Query for a unary =' do
                expecteds = {
                  '956$u{=856$u}' => Query.new(tag956, vfv_sfu, implicit_eq_vf856u)
                }
                check_all(expecteds)
              end
            end

            context 'repeated subSpecs' do
              it 'returns a Query' do
                expecteds = {
                  '956$u{?956$u}{956$u=856$u}' => Query.new(tag956, vfv_sfu, vf956u_exist.and(vf956u_eq_vf856u)),
                  '956$u{?956$u}{=856$u}' => Query.new(tag956, vfv_sfu, vf956u_exist.and(implicit_eq_vf856u))
                }
                check_all(expecteds)
              end
            end

            context 'chained subTerms' do
              it 'returns a Query' do
                expecteds = {
                  '956$u{?856$u|956$u=856$u}' => Query.new(tag956, vfv_sfu, vf856u_exist.or(vf956u_eq_vf856u)),
                  '956$u{?856$u|=856$u}' => Query.new(tag956, vfv_sfu, vf856u_exist.or(implicit_eq_vf856u))
                }
                check_all(expecteds)
              end
            end
          end

          describe 'comparisonString' do
            it 'returns a Query' do
              expecteds = {
                '008/18{LDR/6=\t}' => Query.new(
                  Tag.new('008'),
                  FixedFieldValue.new(Position.new(18)),
                  Condition.new(
                    '=',
                    left: Query.new(Tag.new('LDR'), FixedFieldValue.new(pos_6)),
                    right: ComparisonString.new('t')
                  )
                )
              }
              check_all(expecteds)
            end
          end

          describe 'subfieldSpec' do
            it 'handles complex combinations of subfields and subspecs' do
              subfield_f = Subfield.new('f')

              expecteds = {
                # see https://github.com/MARCspec/MARCspec/issues/30
                '880$a{?$f}$b$c$e{$f=\\q}' => Query.new(
                  Tag.new('880'),
                  Query.new(Subfield.new('a'), Condition.new('?', right: subfield_f)),
                  Subfield.new('b'),
                  Subfield.new('c'),
                  Query.new(Subfield.new('e'), Condition.new('=', left: subfield_f, right: ComparisonString.new('q')))
                )
              }
              check_all(expecteds)
            end
          end
        end

        # ------------------------------------------------------------
        # Examples

        # Examples from http://marcspec.github.io/MARCspec/marc-spec.html#general-form
        describe 'examples' do
          it '9.2 Reference to field data' do
            examples = {
              'LDR' => (Tag.new('LDR')),
              '00.' => (Tag.new('00.')),
              '7..' => (Tag.new('7..')),
              '100' => (Tag.new('100'))
            }
            check_all(examples)
          end

          it '9.3 Reference to substring"' do
            examples = {
              'LDR/0-4' => (Query.new(Tag.new('LDR'), FixedFieldValue.new(AlNumRange.new(0, 4)))),
              'LDR/6' => (Query.new(Tag.new('LDR'), FixedFieldValue.new(pos_6))),
              '007/0' => (Query.new(Tag.new('007'), FixedFieldValue.new(pos_0))),
              '007/1-#' => (Query.new(Tag.new('007'), FixedFieldValue.new(AlNumRange.new(1, nil)))),
              '007/#' => (Query.new(Tag.new('007'), FixedFieldValue.new(Position.new(nil)))),
              '245$a/#-1' => (
                Query.new(Tag.new('245'), VarFieldValue.new(SubfieldValue.new(
                  Subfield.new('a'), AlNumRange.new(nil, 1)
                )))
              )
            }
            check_all(examples)
          end

          it '9.4 Reference to data content' do
            sqs_abc = (%w[a b c].map { |code| Query.new(VarFieldValue.new(Subfield.new(code))) })
            sqs_dollar_underscore = %w[_ $].map { |code| Query.new(VarFieldValue.new(Subfield.new(code))) }
            examples = {
              '245$a' => (Query.new(Tag.new('245'), VarFieldValue.new(Subfield.new('a')))),
              '245$a$b$c' => Query.new(Tag.new('245'), *sqs_abc),
              '245$a-c' => (Query.new(Tag.new('245'), VarFieldValue.new(Subfield.new(AlNumRange.new('a', 'c'))))),
              '...$_$$' => Query.new(Tag.new('...'), *sqs_dollar_underscore)
            }
            check_all(examples)
          end

          it '9.5 Reference to occurrence' do
            examples = {
              '300[0]' => (Tag.new('300', pos_0)),
              '300[1]' => (Tag.new('300', pos_1)),
              '300[0-2]' => (Tag.new('300', range_0_2)),
              '300[1-#]' => (Tag.new('300', AlNumRange.new(1, nil))),
              '300[#]' => (Tag.new('300', Position.new(nil))),
              '300[#-1]' => (Tag.new('300', AlNumRange.new(nil, 1)))
            }
            check_all(examples)
          end

          it '9.6 Reference to indicator values' do
            examples = {
              '880^1' => (Query.new(Tag.new('880'), ind1)),
              '880[1]^2' => (Query.new(Tag.new('880', pos_1), ind2))
            }
            check_all(examples)
          end

          context '9.7 SubSpecs' do
            it '9.7.1 General' do
              vf020c_if_vf020a = Query.new(
                Query.new(Tag.new('020'), VarFieldValue.new(Subfield.new('c'))),
                Condition.new(
                  '?',
                  right: Query.new(Tag.new('020'), VarFieldValue.new(Subfield.new('a')))
                )
              )

              vf020z_unless_vf020a = Query.new(
                Query.new(Tag.new('020'), VarFieldValue.new(Subfield.new('z'))),
                Condition.new(
                  '!',
                  right: Query.new(Tag.new('020'), VarFieldValue.new(Subfield.new('a')))
                )
              )

              ldr7 = Query.new(Tag.new('LDR'), FixedFieldValue.new(Position.new(7)))
              ldr6 = Query.new(Tag.new('LDR'), FixedFieldValue.new(pos_6))

              ff007_0 = Query.new(Tag.new('007'), FixedFieldValue.new(pos_0))

              cstr_t = ComparisonString.new('t')
              cstr_a = ComparisonString.new('a')
              cstr_c = ComparisonString.new('c')
              cstr_d = ComparisonString.new('d')
              cstr_m = ComparisonString.new('m')

              examples = {
                '020$c{?020$a}' => vf020c_if_vf020a,
                '020$c{020$c?020$a}' => vf020c_if_vf020a,
                '020$z{!020$a}' => vf020z_unless_vf020a,
                '020$z{020$z!020$a}' => vf020z_unless_vf020a,
                '008/18{LDR/6=\\t}' => Query.new(
                  Query.new(Tag.new('008'), FixedFieldValue.new(Position.new(18))),
                  Condition.new('=', left: ldr6, right: cstr_t)
                ),
                '245$b{007/0=\\a|007/0=\\t}' => Query.new(
                  Query.new(Tag.new('245'), VarFieldValue.new(Subfield.new('b'))),
                  Condition.any_of(
                    Condition.new('=', left: ff007_0, right: cstr_a),
                    Condition.new('=', left: ff007_0, right: cstr_t)
                  )
                ),
                '008/18{LDR/6=\\a}{LDR/7=\\a|LDR/7=\\c|LDR/7=\\d|LDR/7=\\m}' => Query.new(
                  Query.new(Tag.new('008'), FixedFieldValue.new(Position.new(18))),
                  Condition.all_of(
                    Condition.new('=', left: ldr6, right: cstr_a),
                    Condition.any_of(
                      Condition.new('=', left: ldr7, right: cstr_a),
                      Condition.new('=', left: ldr7, right: cstr_c),
                      Condition.new('=', left: ldr7, right: cstr_d),
                      Condition.new('=', left: ldr7, right: cstr_m)
                    )
                  )
                ),
                '880$a{100$6~$6/3-5}{100$6~\880}' => Query.new(
                  Query.new(Tag.new('880'), VarFieldValue.new(Subfield.new('a'))),
                  Condition.all_of(
                    Condition.new(
                      '~',
                      left: Query.new(Tag.new('100'), VarFieldValue.new(Subfield.new('6'))),
                      # TODO: should we reify the semantics here?
                      # right: VarFieldValue.create(Tag.new('100'), SubfieldValue.new(Subfield.new('6'), AlNumRange.new(3, 5)))
                      right: SubfieldValue.new(Subfield.new('6'), AlNumRange.new(3, 5))
                    ),
                    Condition.new(
                      '~',
                      left: Query.new(Tag.new('100'), VarFieldValue.new(Subfield.new('6'))),
                      right: ComparisonString.new('880')
                    )
                  )
                )
              }
              check_all(examples)
            end

            it '9.7.2 Abbreviations' do
              tag_007_1 = Tag.new('007', pos_1)
              ff007_1_3 = Query.new(tag_007_1, FixedFieldValue.new(pos_3))
              examples = {
                '007[1]/3{/0=\\v}' => Query.new(
                  ff007_1_3,
                  Condition.new(
                    '=',
                    left: Position.new('0'),
                    right: ComparisonString.new('v')
                  )
                ),
                '007[1]/3{007[1]/0=\\v}' => Query.new(
                  ff007_1_3,
                  Condition.new(
                    '=',
                    left: Query.new(tag_007_1, FixedFieldValue.new(pos_0)),
                    right: ComparisonString.new('v')
                  )
                )
              }
              check_all(examples)
            end
          end
        end
      end
    end
  end
end
