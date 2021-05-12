require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve, RubyParenthesesAfterMethodCallInspection
module MARC
  module Spec
    describe :field_tag do
      let(:parser) { Parser.new }

      describe 'field tags are strings and match pattern (valid)' do
        it 'too many wildcards (invalid)' do
          expect(parser.field_tag).not_to parse('....', trace: true)
        end
        it 'too many chars (invalid)' do
          expect(parser.field_tag).not_to parse('ABCD', trace: true)
        end
        it 'invalid char ? (invalid)' do
          expect(parser.field_tag).not_to parse('?00', trace: true)
        end
        it 'mix of lowercase and uppercase chars (invalid)' do
          expect(parser.field_tag).not_to parse('abC', trace: true)
        end
        it 'mix of digit, lowercase and uppercase chars (invalid)' do
          expect(parser.field_tag).not_to parse('a0C', trace: true)
        end
        it 'mix of wildcard, lowercase and uppercase chars (invalid)' do
          expect(parser.field_tag).not_to parse('a.C', trace: true)
        end
        it 'invalid char # (invalid)' do
          expect(parser.field_tag).not_to parse('24#', trace: true)
        end
        it 'invalid whitespace (invalid)' do
          expect(parser.field_tag).not_to parse('24 ', trace: true)
        end
        it 'invalid whitespace (invalid)' do
          expect(parser.field_tag).not_to parse('2 5', trace: true)
        end
        it 'invalid whitespace (invalid)' do
          expect(parser.field_tag).not_to parse(' 45', trace: true)
        end
      end
      let(:parser) { Parser.new }

      describe 'field tags are strings and match pattern (valid)' do
        it 'all wildcards (valid)' do
          expect(parser.field_tag).to parse('...', trace: true)
        end
        it 'two wildcards left with digit (valid)' do
          expect(parser.field_tag).to parse('..0', trace: true)
        end
        it 'one wildcard left with two digits (valid)' do
          expect(parser.field_tag).to parse('.00', trace: true)
        end
        it 'wildcard between digits (valid)' do
          expect(parser.field_tag).to parse('1.0', trace: true)
        end
        it 'two digits wildcard right (valid)' do
          expect(parser.field_tag).to parse('20.', trace: true)
        end
        it 'one digit two wildcards right (valid)' do
          expect(parser.field_tag).to parse('2..', trace: true)
        end
        it 'all digits (valid)' do
          expect(parser.field_tag).to parse('300', trace: true)
        end
        it 'all uppercase chars special leader (valid)' do
          expect(parser.field_tag).to parse('LDR', trace: true)
        end
        it 'all uppercase chars (valid)' do
          expect(parser.field_tag).to parse('ABC', trace: true)
        end
        it 'two wildcards left one uppercase char (valid)' do
          expect(parser.field_tag).to parse('..C', trace: true)
        end
        it 'one wildcard left two uppercase chars (valid)' do
          expect(parser.field_tag).to parse('.BC', trace: true)
        end
        it 'one wildcard between uppercase chars (valid)' do
          expect(parser.field_tag).to parse('A.C', trace: true)
        end
        it 'one uppercase char two wildcards right (valid)' do
          expect(parser.field_tag).to parse('A..', trace: true)
        end
        it 'mix one lowercase char and two digits (valid)' do
          expect(parser.field_tag).to parse('a00', trace: true)
        end
        it 'mix two lowercase chars and one digit (valid)' do
          expect(parser.field_tag).to parse('aa0', trace: true)
        end
        it 'all lowercase chars (valid)' do
          expect(parser.field_tag).to parse('abc', trace: true)
        end
        it 'two wildcards and one lowercase char right (valid)' do
          expect(parser.field_tag).to parse('..c', trace: true)
        end
        it 'one wildcard left and two lowercase chars (valid)' do
          expect(parser.field_tag).to parse('.bc', trace: true)
        end
        it 'one lowercase and two wildcards right (valid)' do
          expect(parser.field_tag).to parse('a..', trace: true)
        end
        it 'all lowercase chars (valid)' do
          expect(parser.field_tag).to parse('abc', trace: true)
        end
      end
      let(:parser) { Parser.new }

      describe 'field tags are strings and match pattern (invalid)' do
        it 'too many wildcards (invalid)' do
          expect(parser.field_tag).not_to parse('....', trace: true)
        end
        it 'too many chars (invalid)' do
          expect(parser.field_tag).not_to parse('ABCD', trace: true)
        end
        it 'invalid char ? (invalid)' do
          expect(parser.field_tag).not_to parse('?00', trace: true)
        end
        it 'mix of lowercase and uppercase chars (invalid)' do
          expect(parser.field_tag).not_to parse('abC', trace: true)
        end
        it 'mix of digit, lowercase and uppercase chars (invalid)' do
          expect(parser.field_tag).not_to parse('a0C', trace: true)
        end
        it 'mix of wildcard, lowercase and uppercase chars (invalid)' do
          expect(parser.field_tag).not_to parse('a.C', trace: true)
        end
        it 'invalid char # (invalid)' do
          expect(parser.field_tag).not_to parse('24#', trace: true)
        end
        it 'invalid whitespace (invalid)' do
          expect(parser.field_tag).not_to parse('24 ', trace: true)
        end
        it 'invalid whitespace (invalid)' do
          expect(parser.field_tag).not_to parse('2 5', trace: true)
        end
        it 'invalid whitespace (invalid)' do
          expect(parser.field_tag).not_to parse(' 45', trace: true)
        end
      end
    end
  end
end
