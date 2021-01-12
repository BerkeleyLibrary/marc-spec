require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve
module MARC
  module Spec
    describe Parser do
      let(:parser) { Parser.new }

      describe :field_tag do
        describe 'field tags are strings and match pattern' do
          it 'too many wildcards' do
            expect(parser.field_tag).not_to parse('....', trace: true)
          end

          it 'too many chars' do
            expect(parser.field_tag).not_to parse('ABCD', trace: true)
          end

          it 'invalid char ?' do
            expect(parser.field_tag).not_to parse('?00', trace: true)
          end

          it 'mix of lowercase and uppercase chars' do
            expect(parser.field_tag).not_to parse('abC', trace: true)
          end

          it 'mix of digit, lowercase and uppercase chars' do
            expect(parser.field_tag).not_to parse('a0C', trace: true)
          end

          it 'mix of wildcard, lowercase and uppercase chars' do
            expect(parser.field_tag).not_to parse('a.C', trace: true)
          end

          it 'invalid char #' do
            expect(parser.field_tag).not_to parse('24#', trace: true)
          end

          it 'invalid whitespace' do
            expect(parser.field_tag).not_to parse('24 ', trace: true)
          end

          it 'invalid whitespace' do
            expect(parser.field_tag).not_to parse('2 5', trace: true)
          end

          it 'invalid whitespace' do
            expect(parser.field_tag).not_to parse(' 45', trace: true)
          end
        end

        describe 'field tags are strings and match pattern' do
          it 'all wildcards' do
            expect(parser.field_tag).to parse('...', trace: true)
          end

          it 'two wildcards left with digit' do
            expect(parser.field_tag).to parse('..0', trace: true)
          end

          it 'one wildcard left with two digits' do
            expect(parser.field_tag).to parse('.00', trace: true)
          end

          it 'wildcard between digits' do
            expect(parser.field_tag).to parse('1.0', trace: true)
          end

          it 'two digits wildcard right' do
            expect(parser.field_tag).to parse('20.', trace: true)
          end

          it 'one digit two wildcards right' do
            expect(parser.field_tag).to parse('2..', trace: true)
          end

          it 'all digits' do
            expect(parser.field_tag).to parse('300', trace: true)
          end

          it 'all uppercase chars special leader' do
            expect(parser.field_tag).to parse('LDR', trace: true)
          end

          it 'all uppercase chars' do
            expect(parser.field_tag).to parse('ABC', trace: true)
          end

          it 'two wildcards left one uppercase char' do
            expect(parser.field_tag).to parse('..C', trace: true)
          end

          it 'one wildcard left two uppercase chars' do
            expect(parser.field_tag).to parse('.BC', trace: true)
          end

          it 'one wildcard between uppercase chars' do
            expect(parser.field_tag).to parse('A.C', trace: true)
          end

          it 'one uppercase char two wildcards right' do
            expect(parser.field_tag).to parse('A..', trace: true)
          end

          it 'mix one lowercase char and two digits' do
            expect(parser.field_tag).to parse('a00', trace: true)
          end

          it 'mix two lowercase chars and one digit' do
            expect(parser.field_tag).to parse('aa0', trace: true)
          end

          it 'all lowercase chars' do
            expect(parser.field_tag).to parse('abc', trace: true)
          end

          it 'two wildcards and one lowercase char right' do
            expect(parser.field_tag).to parse('..c', trace: true)
          end

          it 'one wildcard left and two lowercase chars' do
            expect(parser.field_tag).to parse('.bc', trace: true)
          end

          it 'one lowercase and two wildcards right' do
            expect(parser.field_tag).to parse('a..', trace: true)
          end

          it 'all lowercase chars' do
            expect(parser.field_tag).to parse('abc', trace: true)
          end
        end
      end
    end
  end
end
