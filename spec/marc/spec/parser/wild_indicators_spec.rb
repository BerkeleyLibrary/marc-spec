require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve, RubyParenthesesAfterMethodCallInspection
module MARC
  module Spec
    describe :wild_indicators do
      let(:parser) { Parser.new }

      describe 'wild combination of valid field tag and invalid indicator' do
        it 'only one character allowed' do
          expect(parser.marc_spec).not_to parse('...^12', trace: true)
        end
        it 'not allowed character' do
          expect(parser.marc_spec).not_to parse('...^3', trace: true)
        end
        it 'empty' do
          expect(parser.marc_spec).not_to parse('...^', trace: true)
        end
      end
      let(:parser) { Parser.new }

      describe 'wild combination of valid field tag and indicator' do
        it 'indicator 1' do
          expect(parser.marc_spec).to parse('...^1', trace: true)
        end
        it 'indicator 2' do
          expect(parser.marc_spec).to parse('...^2', trace: true)
        end
      end
    end
  end
end
