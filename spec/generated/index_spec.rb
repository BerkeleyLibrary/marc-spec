require 'spec_helper'
require 'parslet/rig/rspec'

module MARC
  module Spec
    module Parsing
      context 'suite' do
        describe :index do
          let(:parser) { Parser.new }
          let(:reporter) { Parslet::ErrorReporter::Deepest.new }

          describe 'marc_spec: valid field tag and index' do
            # /valid/wildCombination_validIndex.json
            it 'first position -> valid' do
              # /valid/wildCombination_validIndex.json
              expect(parser.marc_spec).to parse('...[0]', trace: true, reporter: reporter)
            end

            it 'last position -> valid' do
              # /valid/wildCombination_validIndex.json
              expect(parser.marc_spec).to parse('...[#]', trace: true, reporter: reporter)
            end

            it 'position 101 -> valid' do
              # /valid/wildCombination_validIndex.json
              expect(parser.marc_spec).to parse('...[100]', trace: true, reporter: reporter)
            end

            it 'position eleven -> valid' do
              # /valid/wildCombination_validIndex.json
              expect(parser.marc_spec).to parse('...[10]', trace: true, reporter: reporter)
            end

            it 'position ten -> valid' do
              # /valid/wildCombination_validIndex.json
              expect(parser.marc_spec).to parse('...[9]', trace: true, reporter: reporter)
            end

            it 'range from first position to first position, is like first position -> valid' do
              # /valid/wildCombination_validIndex.json
              expect(parser.marc_spec).to parse('...[0-0]', trace: true, reporter: reporter)
            end

            it 'range from first position to last -> valid' do
              # /valid/wildCombination_validIndex.json
              expect(parser.marc_spec).to parse('...[0-#]', trace: true, reporter: reporter)
            end

            it 'range from first position to second -> valid' do
              # /valid/wildCombination_validIndex.json
              expect(parser.marc_spec).to parse('...[0-1]', trace: true, reporter: reporter)
            end

            it 'range from last position to last position, is like last position -> valid' do
              # /valid/wildCombination_validIndex.json
              expect(parser.marc_spec).to parse('...[#-#]', trace: true, reporter: reporter)
            end

            it 'range from last position to position one (index reverted), is like last position -> valid' do
              # /valid/wildCombination_validIndex.json
              expect(parser.marc_spec).to parse('...[#-0]', trace: true, reporter: reporter)
            end

            it 'range from last position to position two (index reverted) -> valid' do
              # /valid/wildCombination_validIndex.json
              expect(parser.marc_spec).to parse('...[#-1]', trace: true, reporter: reporter)
            end

          end
          describe 'marc_spec: valid field tag and invalid index' do
            # /invalid/wildCombination_invalidIndex.json
            it 'empty string -> invalid' do
              # /invalid/wildCombination_invalidIndex.json
              expect(parser.marc_spec).not_to parse('...[]', trace: true, reporter: reporter)
            end

            it 'missing ending position -> invalid' do
              # /invalid/wildCombination_invalidIndex.json
              expect(parser.marc_spec).not_to parse('...[#-]', trace: true, reporter: reporter)
            end

            it 'missing starting position -> invalid' do
              # /invalid/wildCombination_invalidIndex.json
              expect(parser.marc_spec).not_to parse('...[-2]', trace: true, reporter: reporter)
            end

            it "only digits, one hyphen and the char '#' are allowed -> invalid" do
              # /invalid/wildCombination_invalidIndex.json
              expect(parser.marc_spec).not_to parse('...[1-X]', trace: true, reporter: reporter)
              expect(parser.marc_spec).not_to parse('...[?]', trace: true, reporter: reporter)
            end

            it 'only one hyphen allwed -> invalid' do
              # /invalid/wildCombination_invalidIndex.json
              expect(parser.marc_spec).not_to parse('...[1-2-]', trace: true, reporter: reporter)
            end

            it 'this matches pattern, but starting position number must not be higher than ending position number -> invalid' do
              # /invalid/wildCombination_invalidIndex.json
              expect(parser.marc_spec).not_to parse('...[2-1]', trace: true, reporter: reporter)
            end

            it 'whitespace is not allowed -> invalid' do
              # /invalid/wildCombination_invalidIndex.json
              expect(parser.marc_spec).not_to parse('...[1- 2]', trace: true, reporter: reporter)
            end

          end
        end
      end
    end
  end
end
