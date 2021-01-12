require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve, RubyParenthesesAfterMethodCallInspection
module MARC
  module Spec
    describe :indicators do
      let(:parser) { Parser.new }

      describe 'indicators are strings and match pattern' do
        it 'only one character allowed' do
          expect(parser.indicators).not_to parse('12', trace: true)
        end
        it 'not allowed character' do
          expect(parser.indicators).not_to parse('3', trace: true)
        end
        it 'empty' do
          expect(parser.indicators).not_to parse('', trace: true)
        end
      end
      let(:parser) { Parser.new }

      describe 'indicators are strings and match pattern' do
        it 'indicator 1' do
          expect(parser.indicators).to parse('1', trace: true)
        end
        it 'indicator 2' do
          expect(parser.indicators).to parse('2', trace: true)
        end
      end
    end
  end
end
