require 'spec_helper'
require 'parslet/rig/rspec'

module BerkeleyLibrary
  module MarcSpec
    module Parser
      context 'suite' do
        describe :indicators do
          let(:parser) { ParserImpl.new }
          let(:reporter) { Parslet::ErrorReporter::Deepest.new }

          describe 'indicators are strings and match pattern' do
            # /invalid/invalidIndicators.json
            it 'empty -> invalid' do
              # /invalid/invalidIndicators.json
              expect(parser.indicators).not_to parse('', trace: true, reporter: reporter)
            end

            it 'indicator 1 -> valid' do
              # /valid/validIndicators.json
              expect(parser.indicators).to parse('1', trace: true, reporter: reporter)
            end

            it 'indicator 2 -> valid' do
              # /valid/validIndicators.json
              expect(parser.indicators).to parse('2', trace: true, reporter: reporter)
            end

            it 'not allowed character -> invalid' do
              # /invalid/invalidIndicators.json
              expect(parser.indicators).not_to parse('3', trace: true, reporter: reporter)
            end

            it 'only one character allowed -> invalid' do
              # /invalid/invalidIndicators.json
              expect(parser.indicators).not_to parse('12', trace: true, reporter: reporter)
            end

          end
          describe 'marc_spec: valid field tag and indicator' do
            # /valid/wildCombination_validIndicators.json
            it 'indicator 1 -> valid' do
              # /valid/wildCombination_validIndicators.json
              expect(parser.marc_spec).to parse('...^1', trace: true, reporter: reporter)
            end

            it 'indicator 2 -> valid' do
              # /valid/wildCombination_validIndicators.json
              expect(parser.marc_spec).to parse('...^2', trace: true, reporter: reporter)
            end

          end
          describe 'marc_spec: valid field tag and invalid indicator' do
            # /invalid/wildCombination_invalidIndicators.json
            it 'empty -> invalid' do
              # /invalid/wildCombination_invalidIndicators.json
              expect(parser.marc_spec).not_to parse('...^', trace: true, reporter: reporter)
            end

            it 'not allowed character -> invalid' do
              # /invalid/wildCombination_invalidIndicators.json
              expect(parser.marc_spec).not_to parse('...^3', trace: true, reporter: reporter)
            end

            it 'only one character allowed -> invalid' do
              # /invalid/wildCombination_invalidIndicators.json
              expect(parser.marc_spec).not_to parse('...^12', trace: true, reporter: reporter)
            end

          end
        end
      end
    end
  end
end
