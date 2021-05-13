require 'spec_helper'
require 'parslet/rig/rspec'

module MARC
  module Spec
    describe :subfield_tag_sub_spec do
      let(:parser) { Parser.new }
      let(:reporter) { Parslet::ErrorReporter::Deepest.new }

      describe 'valid field tag, subfield tag and subspec' do
        it 'subfieldtag & && all digits -> valid' do
          # /valid/wildCombination_validSubfieldTagSubSpec.json
          expect(parser.marc_spec).to parse('...$&{$a~\\Poe}', trace: true, reporter: reporter)
        end

        it 'subfieldtag & && all lowercase chars -> valid' do
          # /valid/wildCombination_validSubfieldTagSubSpec.json
          expect(parser.marc_spec).to parse('...$&{$a~\\test\\{}', trace: true, reporter: reporter)
          expect(parser.marc_spec).to parse('...$&{$a~\\test\\~}', trace: true, reporter: reporter)
          expect(parser.marc_spec).to parse('...$&{$a~\\test\\?}', trace: true, reporter: reporter)
          expect(parser.marc_spec).to parse('...$&{$a~\\test\\|}', trace: true, reporter: reporter)
        end

        it 'subfieldtag & && all uppercase chars special leader -> valid' do
          # /valid/wildCombination_validSubfieldTagSubSpec.json
          expect(parser.marc_spec).to parse('...$&{$a!~\\Poe}', trace: true, reporter: reporter)
        end

        it 'subfieldtag & && all wildcards -> valid' do
          # /valid/wildCombination_validSubfieldTagSubSpec.json
          expect(parser.marc_spec).to parse('...$&{245$a}', trace: true, reporter: reporter)
        end

        it 'subfieldtag & && mix one lowercase char and two digits -> valid' do
          # /valid/wildCombination_validSubfieldTagSubSpec.json
          expect(parser.marc_spec).to parse('...$&{$a|$b|$c}', trace: true, reporter: reporter)
        end

        it 'subfieldtag & && mix two lowercase chars and one digit -> valid' do
          # /valid/wildCombination_validSubfieldTagSubSpec.json
          expect(parser.marc_spec).to parse('...$&{$a~\\test\\$}', trace: true, reporter: reporter)
        end

        it 'subfieldtag & && one digit two wildcards right -> valid' do
          # /valid/wildCombination_validSubfieldTagSubSpec.json
          expect(parser.marc_spec).to parse('...$&{$a!=$b}', trace: true, reporter: reporter)
        end

        it 'subfieldtag & && one lowercase and two wildcards right -> valid' do
          # /valid/wildCombination_validSubfieldTagSubSpec.json
          expect(parser.marc_spec).to parse('...$&{$a~\\test\\=}', trace: true, reporter: reporter)
        end

        it 'subfieldtag & && one uppercase char two wildcards right -> valid' do
          # /valid/wildCombination_validSubfieldTagSubSpec.json
          expect(parser.marc_spec).to parse('...$&{$a|$b}{$c|$d}', trace: true, reporter: reporter)
        end

        it 'subfieldtag & && one wildcard between uppercase chars -> valid' do
          # /valid/wildCombination_validSubfieldTagSubSpec.json
          expect(parser.marc_spec).to parse('...$&{$a}{$b|$c}', trace: true, reporter: reporter)
        end

        it 'subfieldtag & && one wildcard left and two lowercase chars -> valid' do
          # /valid/wildCombination_validSubfieldTagSubSpec.json
          expect(parser.marc_spec).to parse('...$&{$a~\\test\\!}', trace: true, reporter: reporter)
        end

        it 'subfieldtag & && one wildcard left two uppercase chars -> valid' do
          # /valid/wildCombination_validSubfieldTagSubSpec.json
          expect(parser.marc_spec).to parse('...$&{$a|$b}{$c}', trace: true, reporter: reporter)
        end

        it 'subfieldtag & && one wildcard left with two digits -> valid' do
          # /valid/wildCombination_validSubfieldTagSubSpec.json
          expect(parser.marc_spec).to parse('...$&{?$a}', trace: true, reporter: reporter)
        end

        it 'subfieldtag & && two digits wildcard right -> valid' do
          # /valid/wildCombination_validSubfieldTagSubSpec.json
          expect(parser.marc_spec).to parse('...$&{$a=$b}', trace: true, reporter: reporter)
        end

        it 'subfieldtag & && two wildcards and one lowercase char right -> valid' do
          # /valid/wildCombination_validSubfieldTagSubSpec.json
          expect(parser.marc_spec).to parse('...$&{$a~\\test\\}}', trace: true, reporter: reporter)
        end

        it 'subfieldtag & && two wildcards left one uppercase char -> valid' do
          # /valid/wildCombination_validSubfieldTagSubSpec.json
          expect(parser.marc_spec).to parse('...$&{/#=\\/}', trace: true, reporter: reporter)
        end

        it 'subfieldtag & && two wildcards left with digit -> valid' do
          # /valid/wildCombination_validSubfieldTagSubSpec.json
          expect(parser.marc_spec).to parse('...$&{$a}', trace: true, reporter: reporter)
        end

        it 'subfieldtag & && wildcard between digits -> valid' do
          # /valid/wildCombination_validSubfieldTagSubSpec.json
          expect(parser.marc_spec).to parse('...$&{!$a}', trace: true, reporter: reporter)
        end

        describe 'lowercase alpha subfieldtag a' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$a{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$a{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$a{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$a{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$a{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$a{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$a{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$a{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$a{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$a{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$a{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$a{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$a{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$a{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$a{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$a{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$a{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$a{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$a{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$a{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$a{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'lowercase alpha subfieldtag z' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$z{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$z{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$z{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$z{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$z{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$z{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$z{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$z{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$z{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$z{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$z{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$z{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$z{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$z{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$z{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$z{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$z{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$z{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$z{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$z{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$z{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'digit subfieldtag 0' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$0{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$0{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$0{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$0{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$0{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$0{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$0{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$0{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$0{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$0{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$0{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$0{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$0{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$0{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$0{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$0{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$0{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$0{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$0{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$0{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$0{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'digit subfieldtag 9' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$9{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$9{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$9{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$9{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$9{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$9{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$9{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$9{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$9{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$9{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$9{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$9{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$9{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$9{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$9{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$9{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$9{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$9{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$9{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$9{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$9{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag !' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$!{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$!{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$!{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$!{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$!{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$!{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$!{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$!{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$!{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$!{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$!{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$!{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$!{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$!{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$!{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$!{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$!{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$!{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$!{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$!{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$!{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag #' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$\#{$a~\\Poe}", trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$\#{$a~\\test\\{}", trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse("...$\#{$a~\\test\\~}", trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse("...$\#{$a~\\test\\?}", trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse("...$\#{$a~\\test\\|}", trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$\#{$a!~\\Poe}", trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$\#{245$a}", trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$\#{$a|$b|$c}", trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$\#{$a~\\test\\$}", trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$\#{$a!=$b}", trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$\#{$a~\\test\\=}", trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$\#{$a|$b}{$c|$d}", trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$\#{$a}{$b|$c}", trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$\#{$a~\\test\\!}", trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$\#{$a|$b}{$c}", trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$\#{?$a}", trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$\#{$a=$b}", trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$\#{$a~\\test\\}}", trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$\#{/#=\\/}", trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$\#{$a}", trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$\#{!$a}", trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag $' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$${$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$${$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$${$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$${$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$${$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$${$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$${245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$${$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$${$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$${$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$${$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$${$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$${$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$${$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$${$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$${?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$${$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$${$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$${/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$${$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$${!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag %' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$%{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$%{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$%{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$%{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$%{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$%{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$%{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$%{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$%{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$%{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$%{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$%{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$%{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$%{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$%{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$%{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$%{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$%{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$%{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$%{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$%{!$a}', trace: true, reporter: reporter)
          end

        end

        describe "subfieldtag '" do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$'{$a~\\Poe}", trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$'{$a~\\test\\{}", trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse("...$'{$a~\\test\\~}", trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse("...$'{$a~\\test\\?}", trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse("...$'{$a~\\test\\|}", trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$'{$a!~\\Poe}", trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$'{245$a}", trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$'{$a|$b|$c}", trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$'{$a~\\test\\$}", trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$'{$a!=$b}", trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$'{$a~\\test\\=}", trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$'{$a|$b}{$c|$d}", trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$'{$a}{$b|$c}", trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$'{$a~\\test\\!}", trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$'{$a|$b}{$c}", trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$'{?$a}", trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$'{$a=$b}", trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$'{$a~\\test\\}}", trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$'{/#=\\/}", trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$'{$a}", trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse("...$'{!$a}", trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag (' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$({$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$({$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$({$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$({$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$({$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$({$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$({245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$({$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$({$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$({$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$({$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$({$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$({$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$({$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$({$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$({?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$({$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$({$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$({/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$({$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$({!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag )' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$){$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$){$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$){$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$){$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$){$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$){$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$){245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$){$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$){$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$){$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$){$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$){$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$){$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$){$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$){$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$){?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$){$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$){$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$){/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$){$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$){!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag *' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$*{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$*{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$*{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$*{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$*{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$*{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$*{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$*{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$*{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$*{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$*{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$*{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$*{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$*{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$*{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$*{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$*{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$*{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$*{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$*{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$*{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag +' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$+{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$+{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$+{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$+{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$+{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$+{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$+{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$+{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$+{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$+{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$+{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$+{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$+{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$+{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$+{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$+{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$+{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$+{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$+{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$+{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$+{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag ,' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$,{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$,{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$,{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$,{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$,{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$,{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$,{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$,{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$,{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$,{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$,{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$,{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$,{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$,{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$,{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$,{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$,{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$,{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$,{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$,{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$,{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag -' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$-{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$-{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$-{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$-{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$-{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$-{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$-{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$-{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$-{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$-{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$-{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$-{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$-{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$-{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$-{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$-{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$-{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$-{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$-{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$-{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$-{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag .' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$.{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$.{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$.{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$.{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$.{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$.{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$.{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$.{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$.{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$.{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$.{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$.{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$.{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$.{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$.{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$.{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$.{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$.{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$.{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$.{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$.{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag /' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$/{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$/{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$/{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$/{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$/{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$/{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$/{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$/{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$/{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$/{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$/{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$/{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$/{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$/{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$/{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$/{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$/{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$/{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$/{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$/{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$/{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag :' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$:{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$:{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$:{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$:{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$:{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$:{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$:{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$:{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$:{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$:{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$:{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$:{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$:{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$:{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$:{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$:{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$:{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$:{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$:{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$:{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$:{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag ;' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$;{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$;{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$;{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$;{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$;{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$;{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$;{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$;{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$;{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$;{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$;{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$;{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$;{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$;{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$;{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$;{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$;{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$;{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$;{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$;{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$;{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag <' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$<{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$<{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$<{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$<{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$<{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$<{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$<{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$<{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$<{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$<{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$<{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$<{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$<{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$<{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$<{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$<{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$<{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$<{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$<{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$<{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$<{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag =' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$={$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$={$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$={$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$={$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$={$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$={$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$={245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$={$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$={$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$={$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$={$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$={$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$={$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$={$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$={$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$={?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$={$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$={$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$={/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$={$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$={!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag >' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$>{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$>{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$>{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$>{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$>{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$>{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$>{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$>{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$>{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$>{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$>{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$>{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$>{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$>{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$>{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$>{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$>{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$>{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$>{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$>{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$>{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag ?' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$?{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$?{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$?{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$?{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$?{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$?{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$?{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$?{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$?{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$?{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$?{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$?{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$?{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$?{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$?{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$?{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$?{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$?{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$?{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$?{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$?{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag [' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$[{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$[{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$[{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$[{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$[{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$[{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$[{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$[{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$[{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$[{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$[{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$[{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$[{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$[{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$[{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$[{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$[{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$[{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$[{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$[{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$[{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag \\' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$\\{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$\\{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$\\{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$\\{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$\\{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$\\{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$\\{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$\\{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$\\{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$\\{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$\\{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$\\{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$\\{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$\\{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$\\{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$\\{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$\\{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$\\{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$\\{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$\\{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$\\{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag ]' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$]{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$]{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$]{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$]{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$]{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$]{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$]{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$]{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$]{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$]{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$]{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$]{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$]{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$]{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$]{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$]{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$]{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$]{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$]{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$]{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$]{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag ^' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$^{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$^{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$^{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$^{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$^{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$^{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$^{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$^{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$^{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$^{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$^{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$^{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$^{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$^{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$^{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$^{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$^{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$^{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$^{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$^{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$^{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag _' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$_{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$_{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$_{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$_{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$_{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$_{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$_{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$_{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$_{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$_{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$_{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$_{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$_{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$_{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$_{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$_{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$_{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$_{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$_{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$_{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$_{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag `' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$`{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$`{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$`{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$`{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$`{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$`{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$`{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$`{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$`{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$`{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$`{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$`{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$`{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$`{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$`{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$`{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$`{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$`{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$`{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$`{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$`{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag {' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...${{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...${{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...${{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...${{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...${{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...${{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...${{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...${{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...${{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...${{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...${{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...${{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...${{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...${{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...${{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...${{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...${{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...${{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...${{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...${{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...${{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag }' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$}{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$}{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$}{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$}{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$}{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$}{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$}{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$}{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$}{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$}{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$}{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$}{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$}{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$}{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$}{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$}{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$}{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$}{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$}{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$}{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$}{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'subfieldtag ~' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$~{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$~{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$~{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$~{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...$~{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$~{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$~{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$~{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$~{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$~{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$~{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$~{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$~{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$~{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$~{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$~{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$~{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$~{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$~{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$~{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validSubfieldTagSubSpec.json
            expect(parser.marc_spec).to parse('...$~{!$a}', trace: true, reporter: reporter)
          end

        end

      end
    end
  end
end
