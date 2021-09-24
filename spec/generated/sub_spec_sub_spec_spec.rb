require 'spec_helper'
require 'parslet/rig/rspec'

module BerkeleyLibrary
  module MarcSpec
    context 'generated' do
      describe :sub_spec_sub_spec do
        let(:parser) { Parser.new }
        let(:reporter) { Parslet::ErrorReporter::Deepest.new }

        describe 'marc_spec: valid field tag and subspecs' do
          # /valid/wildCombination_validSubSpecSubSpec.json

          describe 'all wildcards' do

            it '&& all digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{245$a}{$a~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{245$a}{$a~\\test\\{}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{245$a}{$a~\\test\\~}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{245$a}{$a~\\test\\?}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{245$a}{$a~\\test\\|}', trace: true, reporter: reporter)
            end

            it '&& all uppercase chars special leader -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{245$a}{$a!~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all wildcards -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{245$a}{245$a}', trace: true, reporter: reporter)
            end

            it '&& mix one lowercase char and two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{245$a}{$a|$b|$c}', trace: true, reporter: reporter)
            end

            it '&& mix two lowercase chars and one digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{245$a}{$a~\\test\\$}', trace: true, reporter: reporter)
            end

            it '&& one digit two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{245$a}{$a!=$b}', trace: true, reporter: reporter)
            end

            it '&& one lowercase and two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{245$a}{$a~\\test\\=}', trace: true, reporter: reporter)
            end

            it '&& one uppercase char two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{245$a}{$a|$b}{$c|$d}', trace: true, reporter: reporter)
            end

            it '&& one wildcard between uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{245$a}{$a}{$b|$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left and two lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{245$a}{$a~\\test\\!}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left two uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{245$a}{$a|$b}{$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left with two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{245$a}{?$a}', trace: true, reporter: reporter)
            end

            it '&& two digits wildcard right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{245$a}{$a=$b}', trace: true, reporter: reporter)
            end

            it '&& two wildcards and one lowercase char right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{245$a}{$a~\\test\\}}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left one uppercase char -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{245$a}{/#=\\/}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left with digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{245$a}{$a}', trace: true, reporter: reporter)
            end

            it '&& wildcard between digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{245$a}{!$a}', trace: true, reporter: reporter)
            end

          end

          describe 'two wildcards left with digit' do

            it '&& all digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$a~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$a~\\test\\{}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a}{$a~\\test\\~}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a}{$a~\\test\\?}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a}{$a~\\test\\|}', trace: true, reporter: reporter)
            end

            it '&& all uppercase chars special leader -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$a!~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all wildcards -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{245$a}', trace: true, reporter: reporter)
            end

            it '&& mix one lowercase char and two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$a|$b|$c}', trace: true, reporter: reporter)
            end

            it '&& mix two lowercase chars and one digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$a~\\test\\$}', trace: true, reporter: reporter)
            end

            it '&& one digit two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$a!=$b}', trace: true, reporter: reporter)
            end

            it '&& one lowercase and two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$a~\\test\\=}', trace: true, reporter: reporter)
            end

            it '&& one uppercase char two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$a|$b}{$c|$d}', trace: true, reporter: reporter)
            end

            it '&& one wildcard between uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$a}{$b|$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left and two lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$a~\\test\\!}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left two uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$a|$b}{$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left with two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{?$a}', trace: true, reporter: reporter)
            end

            it '&& two digits wildcard right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$a=$b}', trace: true, reporter: reporter)
            end

            it '&& two wildcards and one lowercase char right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$a~\\test\\}}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left one uppercase char -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{/#=\\/}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left with digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$a}', trace: true, reporter: reporter)
            end

            it '&& wildcard between digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{!$a}', trace: true, reporter: reporter)
            end

          end

          describe 'one wildcard left with two digits' do

            it '&& all digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{?$a}{$a~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{?$a}{$a~\\test\\{}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{?$a}{$a~\\test\\~}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{?$a}{$a~\\test\\?}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{?$a}{$a~\\test\\|}', trace: true, reporter: reporter)
            end

            it '&& all uppercase chars special leader -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{?$a}{$a!~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all wildcards -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{?$a}{245$a}', trace: true, reporter: reporter)
            end

            it '&& mix one lowercase char and two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{?$a}{$a|$b|$c}', trace: true, reporter: reporter)
            end

            it '&& mix two lowercase chars and one digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{?$a}{$a~\\test\\$}', trace: true, reporter: reporter)
            end

            it '&& one digit two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{?$a}{$a!=$b}', trace: true, reporter: reporter)
            end

            it '&& one lowercase and two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{?$a}{$a~\\test\\=}', trace: true, reporter: reporter)
            end

            it '&& one uppercase char two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{?$a}{$a|$b}{$c|$d}', trace: true, reporter: reporter)
            end

            it '&& one wildcard between uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{?$a}{$a}{$b|$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left and two lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{?$a}{$a~\\test\\!}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left two uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{?$a}{$a|$b}{$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left with two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{?$a}{?$a}', trace: true, reporter: reporter)
            end

            it '&& two digits wildcard right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{?$a}{$a=$b}', trace: true, reporter: reporter)
            end

            it '&& two wildcards and one lowercase char right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{?$a}{$a~\\test\\}}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left one uppercase char -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{?$a}{/#=\\/}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left with digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{?$a}{$a}', trace: true, reporter: reporter)
            end

            it '&& wildcard between digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{?$a}{!$a}', trace: true, reporter: reporter)
            end

          end

          describe 'wildcard between digits' do

            it '&& all digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{!$a}{$a~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{!$a}{$a~\\test\\{}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{!$a}{$a~\\test\\~}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{!$a}{$a~\\test\\?}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{!$a}{$a~\\test\\|}', trace: true, reporter: reporter)
            end

            it '&& all uppercase chars special leader -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{!$a}{$a!~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all wildcards -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{!$a}{245$a}', trace: true, reporter: reporter)
            end

            it '&& mix one lowercase char and two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{!$a}{$a|$b|$c}', trace: true, reporter: reporter)
            end

            it '&& mix two lowercase chars and one digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{!$a}{$a~\\test\\$}', trace: true, reporter: reporter)
            end

            it '&& one digit two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{!$a}{$a!=$b}', trace: true, reporter: reporter)
            end

            it '&& one lowercase and two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{!$a}{$a~\\test\\=}', trace: true, reporter: reporter)
            end

            it '&& one uppercase char two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{!$a}{$a|$b}{$c|$d}', trace: true, reporter: reporter)
            end

            it '&& one wildcard between uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{!$a}{$a}{$b|$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left and two lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{!$a}{$a~\\test\\!}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left two uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{!$a}{$a|$b}{$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left with two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{!$a}{?$a}', trace: true, reporter: reporter)
            end

            it '&& two digits wildcard right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{!$a}{$a=$b}', trace: true, reporter: reporter)
            end

            it '&& two wildcards and one lowercase char right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{!$a}{$a~\\test\\}}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left one uppercase char -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{!$a}{/#=\\/}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left with digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{!$a}{$a}', trace: true, reporter: reporter)
            end

            it '&& wildcard between digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{!$a}{!$a}', trace: true, reporter: reporter)
            end

          end

          describe 'two digits wildcard right' do

            it '&& all digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a=$b}{$a~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a=$b}{$a~\\test\\{}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a=$b}{$a~\\test\\~}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a=$b}{$a~\\test\\?}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a=$b}{$a~\\test\\|}', trace: true, reporter: reporter)
            end

            it '&& all uppercase chars special leader -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a=$b}{$a!~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all wildcards -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a=$b}{245$a}', trace: true, reporter: reporter)
            end

            it '&& mix one lowercase char and two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a=$b}{$a|$b|$c}', trace: true, reporter: reporter)
            end

            it '&& mix two lowercase chars and one digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a=$b}{$a~\\test\\$}', trace: true, reporter: reporter)
            end

            it '&& one digit two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a=$b}{$a!=$b}', trace: true, reporter: reporter)
            end

            it '&& one lowercase and two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a=$b}{$a~\\test\\=}', trace: true, reporter: reporter)
            end

            it '&& one uppercase char two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a=$b}{$a|$b}{$c|$d}', trace: true, reporter: reporter)
            end

            it '&& one wildcard between uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a=$b}{$a}{$b|$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left and two lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a=$b}{$a~\\test\\!}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left two uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a=$b}{$a|$b}{$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left with two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a=$b}{?$a}', trace: true, reporter: reporter)
            end

            it '&& two digits wildcard right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a=$b}{$a=$b}', trace: true, reporter: reporter)
            end

            it '&& two wildcards and one lowercase char right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a=$b}{$a~\\test\\}}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left one uppercase char -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a=$b}{/#=\\/}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left with digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a=$b}{$a}', trace: true, reporter: reporter)
            end

            it '&& wildcard between digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a=$b}{!$a}', trace: true, reporter: reporter)
            end

          end

          describe 'one digit two wildcards right' do

            it '&& all digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!=$b}{$a~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!=$b}{$a~\\test\\{}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a!=$b}{$a~\\test\\~}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a!=$b}{$a~\\test\\?}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a!=$b}{$a~\\test\\|}', trace: true, reporter: reporter)
            end

            it '&& all uppercase chars special leader -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!=$b}{$a!~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all wildcards -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!=$b}{245$a}', trace: true, reporter: reporter)
            end

            it '&& mix one lowercase char and two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!=$b}{$a|$b|$c}', trace: true, reporter: reporter)
            end

            it '&& mix two lowercase chars and one digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!=$b}{$a~\\test\\$}', trace: true, reporter: reporter)
            end

            it '&& one digit two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!=$b}{$a!=$b}', trace: true, reporter: reporter)
            end

            it '&& one lowercase and two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!=$b}{$a~\\test\\=}', trace: true, reporter: reporter)
            end

            it '&& one uppercase char two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!=$b}{$a|$b}{$c|$d}', trace: true, reporter: reporter)
            end

            it '&& one wildcard between uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!=$b}{$a}{$b|$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left and two lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!=$b}{$a~\\test\\!}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left two uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!=$b}{$a|$b}{$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left with two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!=$b}{?$a}', trace: true, reporter: reporter)
            end

            it '&& two digits wildcard right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!=$b}{$a=$b}', trace: true, reporter: reporter)
            end

            it '&& two wildcards and one lowercase char right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!=$b}{$a~\\test\\}}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left one uppercase char -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!=$b}{/#=\\/}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left with digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!=$b}{$a}', trace: true, reporter: reporter)
            end

            it '&& wildcard between digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!=$b}{!$a}', trace: true, reporter: reporter)
            end

          end

          describe 'all digits' do

            it '&& all digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a~\\test\\{}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a~\\test\\~}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a~\\test\\?}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a~\\test\\|}', trace: true, reporter: reporter)
            end

            it '&& all uppercase chars special leader -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a!~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all wildcards -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\Poe}{245$a}', trace: true, reporter: reporter)
            end

            it '&& mix one lowercase char and two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a|$b|$c}', trace: true, reporter: reporter)
            end

            it '&& mix two lowercase chars and one digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a~\\test\\$}', trace: true, reporter: reporter)
            end

            it '&& one digit two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a!=$b}', trace: true, reporter: reporter)
            end

            it '&& one lowercase and two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a~\\test\\=}', trace: true, reporter: reporter)
            end

            it '&& one uppercase char two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a|$b}{$c|$d}', trace: true, reporter: reporter)
            end

            it '&& one wildcard between uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a}{$b|$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left and two lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a~\\test\\!}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left two uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a|$b}{$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left with two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\Poe}{?$a}', trace: true, reporter: reporter)
            end

            it '&& two digits wildcard right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a=$b}', trace: true, reporter: reporter)
            end

            it '&& two wildcards and one lowercase char right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a~\\test\\}}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left one uppercase char -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\Poe}{/#=\\/}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left with digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a}', trace: true, reporter: reporter)
            end

            it '&& wildcard between digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\Poe}{!$a}', trace: true, reporter: reporter)
            end

          end

          describe 'all uppercase chars special leader' do

            it '&& all digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a~\\test\\{}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a~\\test\\~}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a~\\test\\?}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a~\\test\\|}', trace: true, reporter: reporter)
            end

            it '&& all uppercase chars special leader -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a!~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all wildcards -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!~\\Poe}{245$a}', trace: true, reporter: reporter)
            end

            it '&& mix one lowercase char and two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a|$b|$c}', trace: true, reporter: reporter)
            end

            it '&& mix two lowercase chars and one digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a~\\test\\$}', trace: true, reporter: reporter)
            end

            it '&& one digit two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a!=$b}', trace: true, reporter: reporter)
            end

            it '&& one lowercase and two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a~\\test\\=}', trace: true, reporter: reporter)
            end

            it '&& one uppercase char two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a|$b}{$c|$d}', trace: true, reporter: reporter)
            end

            it '&& one wildcard between uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a}{$b|$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left and two lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a~\\test\\!}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left two uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a|$b}{$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left with two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!~\\Poe}{?$a}', trace: true, reporter: reporter)
            end

            it '&& two digits wildcard right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a=$b}', trace: true, reporter: reporter)
            end

            it '&& two wildcards and one lowercase char right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a~\\test\\}}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left one uppercase char -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!~\\Poe}{/#=\\/}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left with digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a}', trace: true, reporter: reporter)
            end

            it '&& wildcard between digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a!~\\Poe}{!$a}', trace: true, reporter: reporter)
            end

          end

          describe 'two wildcards left one uppercase char' do

            it '&& all digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{/#=\\/}{$a~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{/#=\\/}{$a~\\test\\{}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{/#=\\/}{$a~\\test\\~}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{/#=\\/}{$a~\\test\\?}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{/#=\\/}{$a~\\test\\|}', trace: true, reporter: reporter)
            end

            it '&& all uppercase chars special leader -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{/#=\\/}{$a!~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all wildcards -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{/#=\\/}{245$a}', trace: true, reporter: reporter)
            end

            it '&& mix one lowercase char and two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{/#=\\/}{$a|$b|$c}', trace: true, reporter: reporter)
            end

            it '&& mix two lowercase chars and one digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{/#=\\/}{$a~\\test\\$}', trace: true, reporter: reporter)
            end

            it '&& one digit two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{/#=\\/}{$a!=$b}', trace: true, reporter: reporter)
            end

            it '&& one lowercase and two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{/#=\\/}{$a~\\test\\=}', trace: true, reporter: reporter)
            end

            it '&& one uppercase char two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{/#=\\/}{$a|$b}{$c|$d}', trace: true, reporter: reporter)
            end

            it '&& one wildcard between uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{/#=\\/}{$a}{$b|$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left and two lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{/#=\\/}{$a~\\test\\!}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left two uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{/#=\\/}{$a|$b}{$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left with two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{/#=\\/}{?$a}', trace: true, reporter: reporter)
            end

            it '&& two digits wildcard right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{/#=\\/}{$a=$b}', trace: true, reporter: reporter)
            end

            it '&& two wildcards and one lowercase char right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{/#=\\/}{$a~\\test\\}}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left one uppercase char -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{/#=\\/}{/#=\\/}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left with digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{/#=\\/}{$a}', trace: true, reporter: reporter)
            end

            it '&& wildcard between digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{/#=\\/}{!$a}', trace: true, reporter: reporter)
            end

          end

          describe 'one wildcard left two uppercase chars' do

            it '&& all digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a~\\test\\{}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a~\\test\\~}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a~\\test\\?}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a~\\test\\|}', trace: true, reporter: reporter)
            end

            it '&& all uppercase chars special leader -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a!~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all wildcards -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c}{245$a}', trace: true, reporter: reporter)
            end

            it '&& mix one lowercase char and two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a|$b|$c}', trace: true, reporter: reporter)
            end

            it '&& mix two lowercase chars and one digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a~\\test\\$}', trace: true, reporter: reporter)
            end

            it '&& one digit two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a!=$b}', trace: true, reporter: reporter)
            end

            it '&& one lowercase and two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a~\\test\\=}', trace: true, reporter: reporter)
            end

            it '&& one uppercase char two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a|$b}{$c|$d}', trace: true, reporter: reporter)
            end

            it '&& one wildcard between uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a}{$b|$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left and two lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a~\\test\\!}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left two uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a|$b}{$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left with two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c}{?$a}', trace: true, reporter: reporter)
            end

            it '&& two digits wildcard right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a=$b}', trace: true, reporter: reporter)
            end

            it '&& two wildcards and one lowercase char right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a~\\test\\}}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left one uppercase char -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c}{/#=\\/}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left with digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a}', trace: true, reporter: reporter)
            end

            it '&& wildcard between digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c}{!$a}', trace: true, reporter: reporter)
            end

          end

          describe 'one wildcard between uppercase chars' do

            it '&& all digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a~\\test\\{}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a~\\test\\~}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a~\\test\\?}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a~\\test\\|}', trace: true, reporter: reporter)
            end

            it '&& all uppercase chars special leader -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a!~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all wildcards -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$b|$c}{245$a}', trace: true, reporter: reporter)
            end

            it '&& mix one lowercase char and two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a|$b|$c}', trace: true, reporter: reporter)
            end

            it '&& mix two lowercase chars and one digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a~\\test\\$}', trace: true, reporter: reporter)
            end

            it '&& one digit two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a!=$b}', trace: true, reporter: reporter)
            end

            it '&& one lowercase and two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a~\\test\\=}', trace: true, reporter: reporter)
            end

            it '&& one uppercase char two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a|$b}{$c|$d}', trace: true, reporter: reporter)
            end

            it '&& one wildcard between uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a}{$b|$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left and two lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a~\\test\\!}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left two uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a|$b}{$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left with two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$b|$c}{?$a}', trace: true, reporter: reporter)
            end

            it '&& two digits wildcard right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a=$b}', trace: true, reporter: reporter)
            end

            it '&& two wildcards and one lowercase char right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a~\\test\\}}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left one uppercase char -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$b|$c}{/#=\\/}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left with digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a}', trace: true, reporter: reporter)
            end

            it '&& wildcard between digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a}{$b|$c}{!$a}', trace: true, reporter: reporter)
            end

          end

          describe 'one uppercase char two wildcards right' do

            it '&& all digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a~\\test\\{}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a~\\test\\~}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a~\\test\\?}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a~\\test\\|}', trace: true, reporter: reporter)
            end

            it '&& all uppercase chars special leader -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a!~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all wildcards -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{245$a}', trace: true, reporter: reporter)
            end

            it '&& mix one lowercase char and two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a|$b|$c}', trace: true, reporter: reporter)
            end

            it '&& mix two lowercase chars and one digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a~\\test\\$}', trace: true, reporter: reporter)
            end

            it '&& one digit two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a!=$b}', trace: true, reporter: reporter)
            end

            it '&& one lowercase and two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a~\\test\\=}', trace: true, reporter: reporter)
            end

            it '&& one uppercase char two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a|$b}{$c|$d}', trace: true, reporter: reporter)
            end

            it '&& one wildcard between uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a}{$b|$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left and two lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a~\\test\\!}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left two uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a|$b}{$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left with two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{?$a}', trace: true, reporter: reporter)
            end

            it '&& two digits wildcard right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a=$b}', trace: true, reporter: reporter)
            end

            it '&& two wildcards and one lowercase char right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a~\\test\\}}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left one uppercase char -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{/#=\\/}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left with digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a}', trace: true, reporter: reporter)
            end

            it '&& wildcard between digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{!$a}', trace: true, reporter: reporter)
            end

          end

          describe 'mix one lowercase char and two digits' do

            it '&& all digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a~\\test\\{}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a~\\test\\~}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a~\\test\\?}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a~\\test\\|}', trace: true, reporter: reporter)
            end

            it '&& all uppercase chars special leader -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a!~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all wildcards -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b|$c}{245$a}', trace: true, reporter: reporter)
            end

            it '&& mix one lowercase char and two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a|$b|$c}', trace: true, reporter: reporter)
            end

            it '&& mix two lowercase chars and one digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a~\\test\\$}', trace: true, reporter: reporter)
            end

            it '&& one digit two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a!=$b}', trace: true, reporter: reporter)
            end

            it '&& one lowercase and two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a~\\test\\=}', trace: true, reporter: reporter)
            end

            it '&& one uppercase char two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a|$b}{$c|$d}', trace: true, reporter: reporter)
            end

            it '&& one wildcard between uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a}{$b|$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left and two lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a~\\test\\!}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left two uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a|$b}{$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left with two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b|$c}{?$a}', trace: true, reporter: reporter)
            end

            it '&& two digits wildcard right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a=$b}', trace: true, reporter: reporter)
            end

            it '&& two wildcards and one lowercase char right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a~\\test\\}}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left one uppercase char -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b|$c}{/#=\\/}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left with digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a}', trace: true, reporter: reporter)
            end

            it '&& wildcard between digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a|$b|$c}{!$a}', trace: true, reporter: reporter)
            end

          end

          describe 'mix two lowercase chars and one digit' do

            it '&& all digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a~\\test\\{}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a~\\test\\~}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a~\\test\\?}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a~\\test\\|}', trace: true, reporter: reporter)
            end

            it '&& all uppercase chars special leader -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a!~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all wildcards -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\$}{245$a}', trace: true, reporter: reporter)
            end

            it '&& mix one lowercase char and two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a|$b|$c}', trace: true, reporter: reporter)
            end

            it '&& mix two lowercase chars and one digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a~\\test\\$}', trace: true, reporter: reporter)
            end

            it '&& one digit two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a!=$b}', trace: true, reporter: reporter)
            end

            it '&& one lowercase and two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a~\\test\\=}', trace: true, reporter: reporter)
            end

            it '&& one uppercase char two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a|$b}{$c|$d}', trace: true, reporter: reporter)
            end

            it '&& one wildcard between uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a}{$b|$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left and two lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a~\\test\\!}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left two uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a|$b}{$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left with two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\$}{?$a}', trace: true, reporter: reporter)
            end

            it '&& two digits wildcard right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a=$b}', trace: true, reporter: reporter)
            end

            it '&& two wildcards and one lowercase char right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a~\\test\\}}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left one uppercase char -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\$}{/#=\\/}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left with digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a}', trace: true, reporter: reporter)
            end

            it '&& wildcard between digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\$}{!$a}', trace: true, reporter: reporter)
            end

          end

          describe 'all lowercase chars' do

            it '&& all digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a~\\Poe}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a~\\Poe}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a~\\Poe}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a~\\test\\{}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a~\\test\\~}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a~\\test\\?}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a~\\test\\|}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a~\\test\\{}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a~\\test\\~}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a~\\test\\?}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a~\\test\\|}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a~\\test\\{}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a~\\test\\~}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a~\\test\\?}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a~\\test\\|}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a~\\test\\{}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a~\\test\\~}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a~\\test\\?}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a~\\test\\|}', trace: true, reporter: reporter)
            end

            it '&& all uppercase chars special leader -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a!~\\Poe}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a!~\\Poe}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a!~\\Poe}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a!~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all wildcards -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\{}{245$a}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\~}{245$a}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\?}{245$a}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\|}{245$a}', trace: true, reporter: reporter)
            end

            it '&& mix one lowercase char and two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a|$b|$c}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a|$b|$c}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a|$b|$c}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a|$b|$c}', trace: true, reporter: reporter)
            end

            it '&& mix two lowercase chars and one digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a~\\test\\$}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a~\\test\\$}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a~\\test\\$}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a~\\test\\$}', trace: true, reporter: reporter)
            end

            it '&& one digit two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a!=$b}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a!=$b}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a!=$b}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a!=$b}', trace: true, reporter: reporter)
            end

            it '&& one lowercase and two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a~\\test\\=}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a~\\test\\=}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a~\\test\\=}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a~\\test\\=}', trace: true, reporter: reporter)
            end

            it '&& one uppercase char two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a|$b}{$c|$d}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a|$b}{$c|$d}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a|$b}{$c|$d}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a|$b}{$c|$d}', trace: true, reporter: reporter)
            end

            it '&& one wildcard between uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a}{$b|$c}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a}{$b|$c}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a}{$b|$c}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a}{$b|$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left and two lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a~\\test\\!}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a~\\test\\!}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a~\\test\\!}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a~\\test\\!}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left two uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a|$b}{$c}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a|$b}{$c}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a|$b}{$c}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a|$b}{$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left with two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\{}{?$a}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\~}{?$a}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\?}{?$a}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\|}{?$a}', trace: true, reporter: reporter)
            end

            it '&& two digits wildcard right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a=$b}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a=$b}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a=$b}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a=$b}', trace: true, reporter: reporter)
            end

            it '&& two wildcards and one lowercase char right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a~\\test\\}}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a~\\test\\}}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a~\\test\\}}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a~\\test\\}}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left one uppercase char -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\{}{/#=\\/}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\~}{/#=\\/}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\?}{/#=\\/}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\|}{/#=\\/}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left with digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a}', trace: true, reporter: reporter)
            end

            it '&& wildcard between digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\{}{!$a}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\~}{!$a}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\?}{!$a}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\|}{!$a}', trace: true, reporter: reporter)
            end

          end

          describe 'two wildcards and one lowercase char right' do

            it '&& all digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a~\\test\\{}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a~\\test\\~}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a~\\test\\?}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a~\\test\\|}', trace: true, reporter: reporter)
            end

            it '&& all uppercase chars special leader -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a!~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all wildcards -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\}}{245$a}', trace: true, reporter: reporter)
            end

            it '&& mix one lowercase char and two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a|$b|$c}', trace: true, reporter: reporter)
            end

            it '&& mix two lowercase chars and one digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a~\\test\\$}', trace: true, reporter: reporter)
            end

            it '&& one digit two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a!=$b}', trace: true, reporter: reporter)
            end

            it '&& one lowercase and two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a~\\test\\=}', trace: true, reporter: reporter)
            end

            it '&& one uppercase char two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a|$b}{$c|$d}', trace: true, reporter: reporter)
            end

            it '&& one wildcard between uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a}{$b|$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left and two lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a~\\test\\!}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left two uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a|$b}{$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left with two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\}}{?$a}', trace: true, reporter: reporter)
            end

            it '&& two digits wildcard right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a=$b}', trace: true, reporter: reporter)
            end

            it '&& two wildcards and one lowercase char right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a~\\test\\}}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left one uppercase char -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\}}{/#=\\/}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left with digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a}', trace: true, reporter: reporter)
            end

            it '&& wildcard between digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\}}{!$a}', trace: true, reporter: reporter)
            end

          end

          describe 'one wildcard left and two lowercase chars' do

            it '&& all digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a~\\test\\{}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a~\\test\\~}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a~\\test\\?}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a~\\test\\|}', trace: true, reporter: reporter)
            end

            it '&& all uppercase chars special leader -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a!~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all wildcards -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\!}{245$a}', trace: true, reporter: reporter)
            end

            it '&& mix one lowercase char and two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a|$b|$c}', trace: true, reporter: reporter)
            end

            it '&& mix two lowercase chars and one digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a~\\test\\$}', trace: true, reporter: reporter)
            end

            it '&& one digit two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a!=$b}', trace: true, reporter: reporter)
            end

            it '&& one lowercase and two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a~\\test\\=}', trace: true, reporter: reporter)
            end

            it '&& one uppercase char two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a|$b}{$c|$d}', trace: true, reporter: reporter)
            end

            it '&& one wildcard between uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a}{$b|$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left and two lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a~\\test\\!}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left two uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a|$b}{$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left with two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\!}{?$a}', trace: true, reporter: reporter)
            end

            it '&& two digits wildcard right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a=$b}', trace: true, reporter: reporter)
            end

            it '&& two wildcards and one lowercase char right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a~\\test\\}}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left one uppercase char -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\!}{/#=\\/}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left with digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a}', trace: true, reporter: reporter)
            end

            it '&& wildcard between digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\!}{!$a}', trace: true, reporter: reporter)
            end

          end

          describe 'one lowercase and two wildcards right' do

            it '&& all digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a~\\test\\{}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a~\\test\\~}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a~\\test\\?}', trace: true, reporter: reporter)
              expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a~\\test\\|}', trace: true, reporter: reporter)
            end

            it '&& all uppercase chars special leader -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a!~\\Poe}', trace: true, reporter: reporter)
            end

            it '&& all wildcards -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\=}{245$a}', trace: true, reporter: reporter)
            end

            it '&& mix one lowercase char and two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a|$b|$c}', trace: true, reporter: reporter)
            end

            it '&& mix two lowercase chars and one digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a~\\test\\$}', trace: true, reporter: reporter)
            end

            it '&& one digit two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a!=$b}', trace: true, reporter: reporter)
            end

            it '&& one lowercase and two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a~\\test\\=}', trace: true, reporter: reporter)
            end

            it '&& one uppercase char two wildcards right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a|$b}{$c|$d}', trace: true, reporter: reporter)
            end

            it '&& one wildcard between uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a}{$b|$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left and two lowercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a~\\test\\!}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left two uppercase chars -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a|$b}{$c}', trace: true, reporter: reporter)
            end

            it '&& one wildcard left with two digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\=}{?$a}', trace: true, reporter: reporter)
            end

            it '&& two digits wildcard right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a=$b}', trace: true, reporter: reporter)
            end

            it '&& two wildcards and one lowercase char right -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a~\\test\\}}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left one uppercase char -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\=}{/#=\\/}', trace: true, reporter: reporter)
            end

            it '&& two wildcards left with digit -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a}', trace: true, reporter: reporter)
            end

            it '&& wildcard between digits -> valid' do
              # /valid/wildCombination_validSubSpecSubSpec.json
              expect(parser.marc_spec).to parse('...{$a~\\test\\=}{!$a}', trace: true, reporter: reporter)
            end

          end

        end
      end
    end
  end
end
