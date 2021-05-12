require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve, RubyParenthesesAfterMethodCallInspection
module MARC
  module Spec
    describe :indicators do
      let(:parser) { Parser.new }

      describe 'indicators are strings and match pattern (valid)' do
        it 'only one character allowed (invalid)' do
          expect(parser.indicators).not_to parse('12', trace: true)
        end
        it 'not allowed character (invalid)' do
          expect(parser.indicators).not_to parse('3', trace: true)
        end
        it 'empty (invalid)' do
          expect(parser.indicators).not_to parse('', trace: true)
        end
      end
      let(:parser) { Parser.new }

      describe 'indicators are strings and match pattern (valid)' do
        it 'indicator 1 (valid)' do
          expect(parser.indicators).to parse('1', trace: true)
        end
        it 'indicator 2 (valid)' do
          expect(parser.indicators).to parse('2', trace: true)
        end
      end
      let(:parser) { Parser.new }

      describe 'indicators are strings and match pattern (invalid)' do
        it 'only one character allowed (invalid)' do
          expect(parser.indicators).not_to parse('12', trace: true)
        end
        it 'not allowed character (invalid)' do
          expect(parser.indicators).not_to parse('3', trace: true)
        end
        it 'empty (invalid)' do
          expect(parser.indicators).not_to parse('', trace: true)
        end
      end
    end
  end
end
