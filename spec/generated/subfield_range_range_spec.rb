require 'spec_helper'
require 'parslet/rig/rspec'

module MarcSpec
  module Parsing
    context 'suite' do
      describe :subfield_range_range do
        let(:parser) { Parser.new }
        let(:reporter) { Parslet::ErrorReporter::Deepest.new }

        describe 'marc_spec: valid field tag and subfield ranges' do
          # /valid/wildCombination_validSubfieldRangeRange.json

          describe 'subfield range with lowercase subfieldtags' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldRangeRange.json
              expect(parser.marc_spec).to parse('...$a-z$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldRangeRange.json
              expect(parser.marc_spec).to parse('...$a-z$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'subfield range with digits' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldRangeRange.json
              expect(parser.marc_spec).to parse('...$0-9$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldRangeRange.json
              expect(parser.marc_spec).to parse('...$0-9$a-z', trace: true, reporter: reporter)
            end

          end

        end
      end
    end
  end
end
