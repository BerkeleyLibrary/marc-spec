require 'spec_helper'
require 'parslet/rig/rspec'

module BerkeleyLibrary
  module MarcSpec
    context 'generated' do
      describe :subfield_range do
        let(:parser) { Parser.new }
        let(:reporter) { Parslet::ErrorReporter::Deepest.new }

        describe 'marc_spec: valid field tag and invalid subfield range' do
          # /invalid/wildCombination_invalidSubfieldRange.json
          it 'matches the pattern but not a valid subfield tag range -> invalid' do
            # /invalid/wildCombination_invalidSubfieldRange.json
            expect(parser.marc_spec).not_to parse('...$1-0', trace: true, reporter: reporter)
            expect(parser.marc_spec).not_to parse('...$z-a', trace: true, reporter: reporter)
          end

          it 'mix of alpha and digit -> invalid' do
            # /invalid/wildCombination_invalidSubfieldRange.json
            expect(parser.marc_spec).not_to parse('...$a-9', trace: true, reporter: reporter)
          end

          it 'mix of digit and alpha -> invalid' do
            # /invalid/wildCombination_invalidSubfieldRange.json
            expect(parser.marc_spec).not_to parse('...$0-a', trace: true, reporter: reporter)
          end

          it 'uppercase chars are not allowed -> invalid' do
            # /invalid/wildCombination_invalidSubfieldRange.json
            expect(parser.marc_spec).not_to parse('...$A-Z', trace: true, reporter: reporter)
          end

        end
        describe 'marc_spec: valid field tag and subfield range' do
          # /valid/wildCombination_validSubfieldRange.json
          it 'subfield range with digits -> valid' do
            # /valid/wildCombination_validSubfieldRange.json
            expect(parser.marc_spec).to parse('...$0-9', trace: true, reporter: reporter)
          end

          it 'subfield range with lowercase subfieldtags -> valid' do
            # /valid/wildCombination_validSubfieldRange.json
            expect(parser.marc_spec).to parse('...$a-z', trace: true, reporter: reporter)
          end

        end
        describe 'subfield ranges are strings and match pattern' do
          # /invalid/invalidSubfieldRange.json
          it 'matches the pattern but not a valid subfield tag range -> invalid' do
            # /invalid/invalidSubfieldRange.json
            expect(parser.subfield_range).not_to parse('1-0', trace: true, reporter: reporter)
            expect(parser.subfield_range).not_to parse('z-a', trace: true, reporter: reporter)
          end

          it 'mix of alpha and digit -> invalid' do
            # /invalid/invalidSubfieldRange.json
            expect(parser.subfield_range).not_to parse('a-9', trace: true, reporter: reporter)
          end

          it 'mix of digit and alpha -> invalid' do
            # /invalid/invalidSubfieldRange.json
            expect(parser.subfield_range).not_to parse('0-a', trace: true, reporter: reporter)
          end

          it 'subfield range with digits -> valid' do
            # /valid/validSubfieldRange.json
            expect(parser.subfield_range).to parse('0-9', trace: true, reporter: reporter)
          end

          it 'subfield range with lowercase subfieldtags -> valid' do
            # /valid/validSubfieldRange.json
            expect(parser.subfield_range).to parse('a-z', trace: true, reporter: reporter)
          end

          it 'uppercase chars are not allowed -> invalid' do
            # /invalid/invalidSubfieldRange.json
            expect(parser.subfield_range).not_to parse('A-Z', trace: true, reporter: reporter)
          end

        end
      end
    end
  end
end
