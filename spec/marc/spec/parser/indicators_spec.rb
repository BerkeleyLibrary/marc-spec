require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve
module MARC
  module Spec
    describe Parser do
      let(:parser) { Parser.new }

      describe :indicators do
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

        describe 'indicators are strings and match pattern' do
          it 'indicator 1' do
            expect(parser.indicators).to parse('1', trace: true)
          end

          it 'indicator 2' do
            expect(parser.indicators).to parse('2', trace: true)
          end
        end

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
end
