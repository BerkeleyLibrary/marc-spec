require 'spec_helper'
require 'parslet/rig/rspec'

module BerkeleyLibrary
  module MarcSpec
    context 'generated' do
      describe :field_tag do
        let(:parser) { Parser.new }
        let(:reporter) { Parslet::ErrorReporter::Deepest.new }

        describe 'field tags are strings and match pattern' do
          # /invalid/invalidFieldTag.json
          it 'all digits -> valid' do
            # /valid/validFieldTag.json
            expect(parser.field_tag).to parse('300', trace: true, reporter: reporter)
          end

          it 'all lowercase chars -> valid' do
            # /valid/validFieldTag.json
            expect(parser.field_tag).to parse('abc', trace: true, reporter: reporter)
          end

          it 'all uppercase chars -> valid' do
            # /valid/validFieldTag.json
            expect(parser.field_tag).to parse('ABC', trace: true, reporter: reporter)
          end

          it 'all uppercase chars special leader -> valid' do
            # /valid/validFieldTag.json
            expect(parser.field_tag).to parse('LDR', trace: true, reporter: reporter)
          end

          it 'all wildcards -> valid' do
            # /valid/validFieldTag.json
            expect(parser.field_tag).to parse('...', trace: true, reporter: reporter)
          end

          it 'invalid char # -> invalid' do
            # /invalid/invalidFieldTag.json
            expect(parser.field_tag).not_to parse('24#', trace: true, reporter: reporter)
          end

          it 'invalid char ? -> invalid' do
            # /invalid/invalidFieldTag.json
            expect(parser.field_tag).not_to parse('?00', trace: true, reporter: reporter)
          end

          it 'invalid whitespace -> invalid' do
            # /invalid/invalidFieldTag.json
            expect(parser.field_tag).not_to parse('24 ', trace: true, reporter: reporter)
            expect(parser.field_tag).not_to parse('2 5', trace: true, reporter: reporter)
            expect(parser.field_tag).not_to parse(' 45', trace: true, reporter: reporter)
          end

          it 'mix of digit, lowercase and uppercase chars -> invalid' do
            # /invalid/invalidFieldTag.json
            expect(parser.field_tag).not_to parse('a0C', trace: true, reporter: reporter)
          end

          it 'mix of lowercase and uppercase chars -> invalid' do
            # /invalid/invalidFieldTag.json
            expect(parser.field_tag).not_to parse('abC', trace: true, reporter: reporter)
          end

          it 'mix of wildcard, lowercase and uppercase chars -> invalid' do
            # /invalid/invalidFieldTag.json
            expect(parser.field_tag).not_to parse('a.C', trace: true, reporter: reporter)
          end

          it 'mix one lowercase char and two digits -> valid' do
            # /valid/validFieldTag.json
            expect(parser.field_tag).to parse('a00', trace: true, reporter: reporter)
          end

          it 'mix two lowercase chars and one digit -> valid' do
            # /valid/validFieldTag.json
            expect(parser.field_tag).to parse('aa0', trace: true, reporter: reporter)
          end

          it 'one digit two wildcards right -> valid' do
            # /valid/validFieldTag.json
            expect(parser.field_tag).to parse('2..', trace: true, reporter: reporter)
          end

          it 'one lowercase and two wildcards right -> valid' do
            # /valid/validFieldTag.json
            expect(parser.field_tag).to parse('a..', trace: true, reporter: reporter)
          end

          it 'one uppercase char two wildcards right -> valid' do
            # /valid/validFieldTag.json
            expect(parser.field_tag).to parse('A..', trace: true, reporter: reporter)
          end

          it 'one wildcard between uppercase chars -> valid' do
            # /valid/validFieldTag.json
            expect(parser.field_tag).to parse('A.C', trace: true, reporter: reporter)
          end

          it 'one wildcard left and two lowercase chars -> valid' do
            # /valid/validFieldTag.json
            expect(parser.field_tag).to parse('.bc', trace: true, reporter: reporter)
          end

          it 'one wildcard left two uppercase chars -> valid' do
            # /valid/validFieldTag.json
            expect(parser.field_tag).to parse('.BC', trace: true, reporter: reporter)
          end

          it 'one wildcard left with two digits -> valid' do
            # /valid/validFieldTag.json
            expect(parser.field_tag).to parse('.00', trace: true, reporter: reporter)
          end

          it 'too many chars -> invalid' do
            # /invalid/invalidFieldTag.json
            expect(parser.field_tag).not_to parse('ABCD', trace: true, reporter: reporter)
          end

          it 'too many wildcards -> invalid' do
            # /invalid/invalidFieldTag.json
            expect(parser.field_tag).not_to parse('....', trace: true, reporter: reporter)
          end

          it 'two digits wildcard right -> valid' do
            # /valid/validFieldTag.json
            expect(parser.field_tag).to parse('20.', trace: true, reporter: reporter)
          end

          it 'two wildcards and one lowercase char right -> valid' do
            # /valid/validFieldTag.json
            expect(parser.field_tag).to parse('..c', trace: true, reporter: reporter)
          end

          it 'two wildcards left one uppercase char -> valid' do
            # /valid/validFieldTag.json
            expect(parser.field_tag).to parse('..C', trace: true, reporter: reporter)
          end

          it 'two wildcards left with digit -> valid' do
            # /valid/validFieldTag.json
            expect(parser.field_tag).to parse('..0', trace: true, reporter: reporter)
          end

          it 'wildcard between digits -> valid' do
            # /valid/validFieldTag.json
            expect(parser.field_tag).to parse('1.0', trace: true, reporter: reporter)
          end

        end
      end
    end
  end
end
