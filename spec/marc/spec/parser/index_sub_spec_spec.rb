require 'spec_helper'
require 'parslet/rig/rspec'

module MARC
  module Spec
    describe :index_sub_spec do
      let(:parser) { Parser.new }
      let(:reporter) { Parslet::ErrorReporter::Deepest.new }

      describe 'valid field tag, index and subspec' do
        # /valid/wildCombination_validIndexSubSpec.json

        describe 'last position' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#]{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#]{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[#]{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[#]{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[#]{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#]{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#]{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#]{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#]{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#]{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#]{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#]{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#]{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#]{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#]{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#]{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#]{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#]{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#]{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#]{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#]{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'first position' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0]{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0]{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[0]{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[0]{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[0]{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0]{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0]{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0]{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0]{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0]{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0]{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0]{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0]{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0]{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0]{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0]{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0]{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0]{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0]{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0]{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0]{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'position ten' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[9]{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[9]{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[9]{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[9]{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[9]{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[9]{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[9]{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[9]{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[9]{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[9]{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[9]{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[9]{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[9]{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[9]{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[9]{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[9]{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[9]{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[9]{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[9]{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[9]{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[9]{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'position eleven' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[10]{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[10]{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[10]{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[10]{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[10]{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[10]{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[10]{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[10]{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[10]{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[10]{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[10]{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[10]{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[10]{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[10]{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[10]{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[10]{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[10]{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[10]{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[10]{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[10]{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[10]{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'position 101' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[100]{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[100]{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[100]{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[100]{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[100]{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[100]{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[100]{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[100]{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[100]{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[100]{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[100]{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[100]{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[100]{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[100]{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[100]{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[100]{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[100]{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[100]{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[100]{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[100]{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[100]{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'range from first position to second' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-1]{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-1]{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[0-1]{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[0-1]{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[0-1]{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-1]{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-1]{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-1]{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-1]{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-1]{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-1]{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-1]{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-1]{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-1]{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-1]{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-1]{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-1]{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-1]{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-1]{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-1]{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-1]{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'range from first position to last' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-#]{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-#]{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[0-#]{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[0-#]{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[0-#]{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-#]{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-#]{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-#]{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-#]{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-#]{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-#]{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-#]{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-#]{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-#]{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-#]{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-#]{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-#]{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-#]{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-#]{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-#]{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-#]{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'range from first position to first position, is like first position' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-0]{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-0]{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[0-0]{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[0-0]{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[0-0]{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-0]{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-0]{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-0]{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-0]{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-0]{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-0]{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-0]{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-0]{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-0]{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-0]{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-0]{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-0]{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-0]{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-0]{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-0]{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[0-0]{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'range from last position to last position, is like last position' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-#]{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-#]{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[#-#]{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[#-#]{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[#-#]{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-#]{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-#]{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-#]{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-#]{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-#]{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-#]{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-#]{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-#]{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-#]{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-#]{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-#]{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-#]{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-#]{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-#]{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-#]{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-#]{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'range from last position to position one (index reverted), is like last position' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-0]{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-0]{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[#-0]{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[#-0]{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[#-0]{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-0]{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-0]{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-0]{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-0]{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-0]{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-0]{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-0]{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-0]{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-0]{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-0]{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-0]{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-0]{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-0]{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-0]{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-0]{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-0]{!$a}', trace: true, reporter: reporter)
          end

        end

        describe 'range from last position to position two (index reverted)' do

          it '&& all digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-1]{$a~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all lowercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-1]{$a~\\test\\{}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[#-1]{$a~\\test\\~}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[#-1]{$a~\\test\\?}', trace: true, reporter: reporter)
            expect(parser.marc_spec).to parse('...[#-1]{$a~\\test\\|}', trace: true, reporter: reporter)
          end

          it '&& all uppercase chars special leader -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-1]{$a!~\\Poe}', trace: true, reporter: reporter)
          end

          it '&& all wildcards -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-1]{245$a}', trace: true, reporter: reporter)
          end

          it '&& mix one lowercase char and two digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-1]{$a|$b|$c}', trace: true, reporter: reporter)
          end

          it '&& mix two lowercase chars and one digit -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-1]{$a~\\test\\$}', trace: true, reporter: reporter)
          end

          it '&& one digit two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-1]{$a!=$b}', trace: true, reporter: reporter)
          end

          it '&& one lowercase and two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-1]{$a~\\test\\=}', trace: true, reporter: reporter)
          end

          it '&& one uppercase char two wildcards right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-1]{$a|$b}{$c|$d}', trace: true, reporter: reporter)
          end

          it '&& one wildcard between uppercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-1]{$a}{$b|$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left and two lowercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-1]{$a~\\test\\!}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left two uppercase chars -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-1]{$a|$b}{$c}', trace: true, reporter: reporter)
          end

          it '&& one wildcard left with two digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-1]{?$a}', trace: true, reporter: reporter)
          end

          it '&& two digits wildcard right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-1]{$a=$b}', trace: true, reporter: reporter)
          end

          it '&& two wildcards and one lowercase char right -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-1]{$a~\\test\\}}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left one uppercase char -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-1]{/#=\\/}', trace: true, reporter: reporter)
          end

          it '&& two wildcards left with digit -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-1]{$a}', trace: true, reporter: reporter)
          end

          it '&& wildcard between digits -> valid' do
            # /valid/wildCombination_validIndexSubSpec.json
            expect(parser.marc_spec).to parse('...[#-1]{!$a}', trace: true, reporter: reporter)
          end

        end

      end
    end
  end
end
