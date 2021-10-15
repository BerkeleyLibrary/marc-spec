require 'spec_helper'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      describe Transform do
        include DSL

        attr_reader :parser
        attr_reader :xform

        before(:each) do
          @parser = Parsing::Parser.new
          @xform = Transform.new
        end

        # ------------------------------------------------------------
        # Helper methods

        def check_all_c(expecteds)
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
            expect(result.right).to eq(tag('956'))
          end
        end

        # ------------------------------------------------------------
        # Applicables

        describe 'applicables' do

          describe 'fieldSpec' do
            describe 'fieldTag' do
              it 'returns a Tag' do
                expecteds = {
                  '856' => tag('856'),
                  '.56' => tag('.56'),
                  '856[3]' => tag('856', pos(3))
                }
                check_all_c(expecteds)
              end
            end

            describe 'fieldTag w/characterSpec' do
              it 'returns a FixedField' do
                expecteds = {
                  '856/3-12' => q(tag('856'), s: ffv(rng(3, 12))),
                  '856[3]/3-12' => q(tag('856', pos(3)), s: ffv(rng(3, 12)))
                }

                check_all_c(expecteds)
              end
            end
          end

          describe 'subfieldSpec' do

            describe 'fieldTag w/subfieldSpec' do
              context 'single subfield' do
                it 'returns a VarField' do
                  expecteds = {
                    '856$u' => q(tag('856'), s: vfv(sf('u'))),
                    '856[3]$u' => q(tag('856', pos(3)), s: vfv(sf('u'))),
                    '856$u[3]' => q(tag('856'), s: vfv(sf('u', pos(3)))),
                    '856$u[3]/1-2' => q(tag('856'), s: vfv(sfv(sf('u', pos(3)), rng(1, 2)))),
                    '856$u/1-2' => q(tag('856'), s: vfv(sfv(sf('u'), rng(1, 2))))
                  }

                  check_all_c(expecteds)
                end
              end

              context 'numeric subfield range' do
                it 'returns a VarField' do
                  range_str = '4-5'

                  expecteds = {
                    "856$#{range_str}" => q(tag('856'), s: vfv(sf(rng(4, 5)))),
                    "856[3]$#{range_str}" => q(tag('856', pos(3)), s: vfv(sf(rng(4, 5)))),
                    "856$#{range_str}[3]" => q(tag('856'), s: vfv(sf(rng(4, 5), pos(3)))),
                    "856$#{range_str}[3]/1-2" => q(tag('856'), s: vfv(sfv(sf(rng(4, 5), pos(3)), rng(1, 2)))),
                    "856$#{range_str}/1-2" => q(tag('856'), s: vfv(sfv(sf(rng(4, 5)), rng(1, 2))))
                  }

                  check_all_c(expecteds)
                end
              end

              context 'alphabetical subfield range' do
                it 'returns a VarField' do
                  range_str = 'd-g'

                  expecteds = {
                    "856$#{range_str}" => q(tag('856'), s: vfv(sf(rng('d', 'g')))),
                    "856[3]$#{range_str}" => q(tag('856', pos(3)), s: vfv(sf(rng('d', 'g')))),
                    "856$#{range_str}[3]" => q(tag('856'), s: vfv(sf(rng('d', 'g'), pos(3)))),
                    "856$#{range_str}[3]/1-2" => q(tag('856'), s: vfv(sfv(sf(rng('d', 'g'), pos(3)), rng(1, 2)))),
                    "856$#{range_str}/1-2" => q(tag('856'), s: vfv(sfv(sf(rng('d', 'g')), rng(1, 2))))
                  }

                  check_all_c(expecteds)
                end
              end
            end
          end

          describe 'indicatorSpec' do
            describe 'fieldTag w/indicator' do
              it 'returns an Indicator' do
                expecteds = {
                  '856^1' => q(tag('856'), s: indv(1)),
                  '856[3-#]^2' => q(tag('856', rng(3)), s: indv(2))
                }
                check_all_c(expecteds)
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
                *args = '?', tag('956')
                expecteds = {
                  '...{?956}' => q(tag('...'), c: c(*args))
                }
                check_all_c(expecteds)
              end
            end
          end

        end

        # ------------------------------------------------------------
        # Complete queries

        describe 'queries' do
          describe 'subSpec' do
            let(:tag956) { tag('956') }
            let(:vf956u) { q(tag956, s: vfv(sf('u'))) }
            let(:vf956u_exist) do
              *args = '?', vf956u
              c(*args)
            end

            let(:tag856) { tag('856') }
            let(:vf856u) { q(tag856, s: vfv(sf('u'))) }
            let(:vf856u_exist) do
              *args = '?', vf856u
              c(*args)
            end

            let(:vf956u_eq_vf856u) do
              *args = vf956u, '=', vf856u
              c(*args)
            end

            # TODO: handle implicit left during transform?
            let(:implicit_eq_vf856u) do
              *args = '=', vf856u
              c(*args)
            end

            # TODO: collapse to one set of expectations
            context 'single subSpec' do
              it 'returns a Query for an implicit unary ?' do
                expecteds = {
                  '956{956$u}' => q(tag956, c: vf956u_exist),
                  '956^1{956$u}' => q(tag956, s: indv(1), c: vf956u_exist)
                }
                check_all_c(expecteds)
              end

              it 'returns a Query for an explicit unary ?' do
                expecteds = {
                  '956{?956$u}' => q(tag956, c: vf956u_exist),
                  '956^1{?956$u}' => q(tag956, s: indv(1), c: vf956u_exist)
                }
                check_all_c(expecteds)
              end

              it 'returns a Query for a binary =' do
                expecteds = {
                  '956{956$u=856$u}' => q(tag956, c: vf956u_eq_vf856u)
                }
                check_all_c(expecteds)
              end

              it 'returns a Query for a unary =' do
                expecteds = {
                  '956$u{=856$u}' => q(tag956, s: vfv(sf('u')), c: implicit_eq_vf856u)
                }
                check_all_c(expecteds)
              end
            end

            context 'repeated subSpecs' do
              it 'returns a Query' do
                expecteds = {
                  '956$u{?956$u}{956$u=856$u}' => q(tag956, s: vfv(sf('u')), c: vf956u_exist.and(vf956u_eq_vf856u)),
                  '956$u{?956$u}{=856$u}' => q(tag956, s: vfv(sf('u')), c: vf956u_exist.and(implicit_eq_vf856u))
                }
                check_all_c(expecteds)
              end
            end

            context 'chained subTerms' do
              it 'returns a Query' do
                expecteds = {
                  '956$u{?856$u|956$u=856$u}' => q(tag956, s: vfv(sf('u')), c: vf856u_exist.or(vf956u_eq_vf856u)),
                  '956$u{?856$u|=856$u}' => q(tag956, s: vfv(sf('u')), c: vf856u_exist.or(implicit_eq_vf856u))
                }
                check_all_c(expecteds)
              end
            end
          end

          describe 'comparisonString' do
            it 'returns a Query' do
              expecteds = {
                '008/18{LDR/6=\t}' => q(tag('008'), s: ffv(pos(18)), c: c(
                  q(tag('LDR'), s: ffv(pos(6))),
                  '=',
                  cstr('t')
                ))
              }
              check_all_c(expecteds)
            end
          end

          describe 'subfieldSpec' do
            it 'handles complex combinations of subfields and subspecs' do
              expecteds = {
                # see https://github.com/MARCspec/MARCspec/issues/30
                '880$a{?$f}$b$c$e{880$f=\\q}' => q(
                  tag('880'),
                  sq: [
                    q(
                      s: sf('a'),
                      c: c('?', q(s: sf('f')))
                    ),
                    q(s: sf('b')),
                    q(s: sf('c')),
                    q(
                      s: sf('e'),
                      c: c(q(tag('880'), s: sf('f')), '=', cstr('q'))
                    )
                  ]
                )
              }
              check_all_c(expecteds)
            end
          end
        end

        # ------------------------------------------------------------
        # Examples

        # Examples from http://marcspec.github.io/MARCspec/marc-spec.html#general-form
        describe 'examples' do
          it '9.2 Reference to field data' do
            examples = {
              'LDR' => tag('LDR'),
              '00.' => tag('00.'),
              '7..' => tag('7..'),
              '100' => tag('100')
            }
            check_all_c(examples)
          end

          it '9.3 Reference to substring"' do
            examples = {
              'LDR/0-4' => q(tag('LDR'), s: ffv(rng(0, 4))),
              'LDR/6' => q(tag('LDR'), s: ffv(pos(6))),
              '007/0' => q(tag('007'), s: ffv(pos(0))),
              '007/1-#' => q(tag('007'), s: ffv(rng(1))),
              '007/#' => q(tag('007'), s: ffv(pos(nil))),
              '245$a/#-1' =>
                q(tag('245'), s: vfv(sfv(
                                       sf('a'), rng(nil, 1)
                                     )))

            }
            check_all_c(examples)
          end

          it '9.4 Reference to data content' do
            sqs_abc = (%w[a b c].map { |code| q(s: vfv(sf(code))) })
            sqs_dollar_underscore = %w[_ $].map { |code| q(s: vfv(sf(code))) }
            examples = {
              '245$a' => q(tag('245'), s: vfv(sf('a'))),
              '245$a$b$c' => q(tag('245'), sq: sqs_abc),
              '245$a-c' => q(tag('245'), s: vfv(sf(rng('a', 'c')))),
              '...$_$$' => q(tag('...'), sq: sqs_dollar_underscore)
            }
            check_all_c(examples)
          end

          it '9.5 Reference to occurrence' do
            examples = {
              '300[0]' => tag('300', pos(0)),
              '300[1]' => tag('300', pos(1)),
              '300[0-2]' => tag('300', rng(0, 2)),
              '300[1-#]' => tag('300', rng(1)),
              '300[#]' => tag('300', pos(nil)),
              '300[#-1]' => tag('300', rng(nil, 1))
            }
            check_all_c(examples)
          end

          it '9.6 Reference to indicator values' do
            examples = {
              '880^1' => q(tag('880'), s: indv(1)),
              '880[1]^2' => q(tag('880', pos(1)), s: indv(2))
            }
            check_all_c(examples)
          end

          context '9.7 SubSpecs' do
            it '9.7.1 General' do
              vf020c_if_vf020a = q(
                tag('020'),
                s: vfv(sf('c')),
                c: c('?', q(tag('020'), s: vfv(sf('a'))))
              )

              vf020z_unless_vf020a = q(
                tag('020'),
                s: vfv(sf('z')),
                c: c('!', q(tag('020'), s: vfv(sf('a'))))
              )

              ldr7 = q(tag('LDR'), s: ffv(pos(7)))
              ldr6 = q(tag('LDR'), s: ffv(pos(6)))

              ff007_0 = q(tag('007'), s: ffv(pos(0)))

              examples = {
                '020$c{?020$a}' => vf020c_if_vf020a,
                '020$c{020$c?020$a}' => vf020c_if_vf020a,
                '020$z{!020$a}' => vf020z_unless_vf020a,
                '020$z{020$z!020$a}' => vf020z_unless_vf020a,
                '008/18{LDR/6=\\t}' => q(tag('008'), s: ffv(pos(18)), c: c(ldr6, '=', cstr('t'))),
                '245$b{007/0=\\a|007/0=\\t}' => q(
                  tag('245'),
                  s: vfv(sf('b')),
                  c: any_c(
                    c(ff007_0, '=', cstr('a')),
                    c(ff007_0, '=', cstr('t'))
                  )
                ),
                '008/18{LDR/6=\\a}{LDR/7=\\a|LDR/7=\\c|LDR/7=\\d|LDR/7=\\m}' => q(
                  tag('008'),
                  s: ffv(pos(18)),
                  c: all_c(
                    c(ldr6, '=', cstr('a')),
                    any_c(
                      c(ldr7, '=', cstr('a')),
                      c(ldr7, '=', cstr('c')),
                      c(ldr7, '=', cstr('d')),
                      c(ldr7, '=', cstr('m'))
                    )
                  )
                ),
                '880$a{100$6~$6/3-5}{100$6~\880}' => q(
                  tag('880'),
                  s: vfv(sf('a')),
                  c: all_c(
                    c(
                      q(
                        tag('100'),
                        s: vfv(sf('6'))
                      ),
                      '~',
                      q(s: sfv(sf('6'), rng(3, 5)))
                    ),
                    c(
                      q(tag('100'), s: vfv(sf('6'))),
                      '~',
                      cstr('880')
                    )
                  )
                )
              }
              check_all_c(examples)
            end

            it '9.7.2 Abbreviations' do
              examples = {
                '007[1]/3{/0=\\v}' => q(tag('007', pos(1)), s: ffv(pos(3)), c: c(q(s: ffv(pos('0'))), '=', cstr('v'))),
                '007[1]/3{007[1]/0=\\v}' => q(tag('007', pos(1)), s: ffv(pos(3)), c: c(q(tag('007', pos(1)), s: ffv(pos(0))), '=', cstr('v')))
              }
              check_all_c(examples)
            end
          end
        end
      end
    end
  end
end
