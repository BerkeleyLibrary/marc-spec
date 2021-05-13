require 'spec_helper'
require 'parslet/rig/rspec'

module MARC
  module Spec
    describe :subfield_range_sub_spec do
      let(:parser) { Parser.new }
      let(:reporter) { Parslet::ErrorReporter::Deepest.new }

      describe 'valid field tag, subfield range and subspec' do
        # /valid/wildCombination_validSubfieldRangeSubSpec.json

        describe 'subfield range with lowercase subfieldtags' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$a-z{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$a-z{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$a-z{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$a-z{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$a-z{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$a-z{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$a-z{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$a-z{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$a-z{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$a-z{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$a-z{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$a-z{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$a-z{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$a-z{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$a-z{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$a-z{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$a-z{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$a-z{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$a-z{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$a-z{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$a-z{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'subfield range with digits' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$0-9{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$0-9{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$0-9{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$0-9{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$0-9{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$0-9{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$0-9{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$0-9{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$0-9{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$0-9{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$0-9{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$0-9{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$0-9{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$0-9{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$0-9{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$0-9{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$0-9{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$0-9{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$0-9{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$0-9{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldRangeSubSpec.json
            expect(parser.marc_spec).to parse('...$0-9{!$a}', trace: true, reporter: reporter)
          end

        end

      end
    end
  end
end
