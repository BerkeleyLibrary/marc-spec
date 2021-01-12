require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve, RubyParenthesesAfterMethodCallInspection
module MARC
  module Spec
    describe :wild_index_sub_spec do
      let(:parser) { Parser.new }

      describe 'wild combination of valid field tag, index and subspec' do
        it 'last position && all wildcards' do
          expect(parser.marc_spec).to parse('...[#]{245$a}', trace: true)
        end
        it 'last position && two wildcards left with digit' do
          expect(parser.marc_spec).to parse('...[#]{$a}', trace: true)
        end
        it 'last position && one wildcard left with two digits' do
          expect(parser.marc_spec).to parse('...[#]{?$a}', trace: true)
        end
        it 'last position && wildcard between digits' do
          expect(parser.marc_spec).to parse('...[#]{!$a}', trace: true)
        end
        it 'last position && two digits wildcard right' do
          expect(parser.marc_spec).to parse('...[#]{$a=$b}', trace: true)
        end
        it 'last position && one digit two wildcards right' do
          expect(parser.marc_spec).to parse('...[#]{$a!=$b}', trace: true)
        end
        it 'last position && all digits' do
          expect(parser.marc_spec).to parse('...[#]{$a~\\Poe}', trace: true)
        end
        it 'last position && all uppercase chars special leader' do
          expect(parser.marc_spec).to parse('...[#]{$a!~\\Poe}', trace: true)
        end
        it 'last position && two wildcards left one uppercase char' do
          expect(parser.marc_spec).to parse('...[#]{/#=\\/}', trace: true)
        end
        it 'last position && one wildcard left two uppercase chars' do
          expect(parser.marc_spec).to parse('...[#]{$a|$b}{$c}', trace: true)
        end
        it 'last position && one wildcard between uppercase chars' do
          expect(parser.marc_spec).to parse('...[#]{$a}{$b|$c}', trace: true)
        end
        it 'last position && one uppercase char two wildcards right' do
          expect(parser.marc_spec).to parse('...[#]{$a|$b}{$c|$d}', trace: true)
        end
        it 'last position && mix one lowercase char and two digits' do
          expect(parser.marc_spec).to parse('...[#]{$a|$b|$c}', trace: true)
        end
        it 'last position && mix two lowercase chars and one digit' do
          expect(parser.marc_spec).to parse('...[#]{$a~\\test\\$}', trace: true)
        end
        it 'last position && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[#]{$a~\\test\\{}', trace: true)
        end
        it 'last position && two wildcards and one lowercase char right' do
          expect(parser.marc_spec).to parse('...[#]{$a~\\test\\}}', trace: true)
        end
        it 'last position && one wildcard left and two lowercase chars' do
          expect(parser.marc_spec).to parse('...[#]{$a~\\test\\!}', trace: true)
        end
        it 'last position && one lowercase and two wildcards right' do
          expect(parser.marc_spec).to parse('...[#]{$a~\\test\\=}', trace: true)
        end
        it 'last position && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[#]{$a~\\test\\~}', trace: true)
        end
        it 'last position && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[#]{$a~\\test\\?}', trace: true)
        end
        it 'last position && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[#]{$a~\\test\\|}', trace: true)
        end
        it 'first position && all wildcards' do
          expect(parser.marc_spec).to parse('...[0]{245$a}', trace: true)
        end
        it 'first position && two wildcards left with digit' do
          expect(parser.marc_spec).to parse('...[0]{$a}', trace: true)
        end
        it 'first position && one wildcard left with two digits' do
          expect(parser.marc_spec).to parse('...[0]{?$a}', trace: true)
        end
        it 'first position && wildcard between digits' do
          expect(parser.marc_spec).to parse('...[0]{!$a}', trace: true)
        end
        it 'first position && two digits wildcard right' do
          expect(parser.marc_spec).to parse('...[0]{$a=$b}', trace: true)
        end
        it 'first position && one digit two wildcards right' do
          expect(parser.marc_spec).to parse('...[0]{$a!=$b}', trace: true)
        end
        it 'first position && all digits' do
          expect(parser.marc_spec).to parse('...[0]{$a~\\Poe}', trace: true)
        end
        it 'first position && all uppercase chars special leader' do
          expect(parser.marc_spec).to parse('...[0]{$a!~\\Poe}', trace: true)
        end
        it 'first position && two wildcards left one uppercase char' do
          expect(parser.marc_spec).to parse('...[0]{/#=\\/}', trace: true)
        end
        it 'first position && one wildcard left two uppercase chars' do
          expect(parser.marc_spec).to parse('...[0]{$a|$b}{$c}', trace: true)
        end
        it 'first position && one wildcard between uppercase chars' do
          expect(parser.marc_spec).to parse('...[0]{$a}{$b|$c}', trace: true)
        end
        it 'first position && one uppercase char two wildcards right' do
          expect(parser.marc_spec).to parse('...[0]{$a|$b}{$c|$d}', trace: true)
        end
        it 'first position && mix one lowercase char and two digits' do
          expect(parser.marc_spec).to parse('...[0]{$a|$b|$c}', trace: true)
        end
        it 'first position && mix two lowercase chars and one digit' do
          expect(parser.marc_spec).to parse('...[0]{$a~\\test\\$}', trace: true)
        end
        it 'first position && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[0]{$a~\\test\\{}', trace: true)
        end
        it 'first position && two wildcards and one lowercase char right' do
          expect(parser.marc_spec).to parse('...[0]{$a~\\test\\}}', trace: true)
        end
        it 'first position && one wildcard left and two lowercase chars' do
          expect(parser.marc_spec).to parse('...[0]{$a~\\test\\!}', trace: true)
        end
        it 'first position && one lowercase and two wildcards right' do
          expect(parser.marc_spec).to parse('...[0]{$a~\\test\\=}', trace: true)
        end
        it 'first position && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[0]{$a~\\test\\~}', trace: true)
        end
        it 'first position && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[0]{$a~\\test\\?}', trace: true)
        end
        it 'first position && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[0]{$a~\\test\\|}', trace: true)
        end
        it 'position ten && all wildcards' do
          expect(parser.marc_spec).to parse('...[9]{245$a}', trace: true)
        end
        it 'position ten && two wildcards left with digit' do
          expect(parser.marc_spec).to parse('...[9]{$a}', trace: true)
        end
        it 'position ten && one wildcard left with two digits' do
          expect(parser.marc_spec).to parse('...[9]{?$a}', trace: true)
        end
        it 'position ten && wildcard between digits' do
          expect(parser.marc_spec).to parse('...[9]{!$a}', trace: true)
        end
        it 'position ten && two digits wildcard right' do
          expect(parser.marc_spec).to parse('...[9]{$a=$b}', trace: true)
        end
        it 'position ten && one digit two wildcards right' do
          expect(parser.marc_spec).to parse('...[9]{$a!=$b}', trace: true)
        end
        it 'position ten && all digits' do
          expect(parser.marc_spec).to parse('...[9]{$a~\\Poe}', trace: true)
        end
        it 'position ten && all uppercase chars special leader' do
          expect(parser.marc_spec).to parse('...[9]{$a!~\\Poe}', trace: true)
        end
        it 'position ten && two wildcards left one uppercase char' do
          expect(parser.marc_spec).to parse('...[9]{/#=\\/}', trace: true)
        end
        it 'position ten && one wildcard left two uppercase chars' do
          expect(parser.marc_spec).to parse('...[9]{$a|$b}{$c}', trace: true)
        end
        it 'position ten && one wildcard between uppercase chars' do
          expect(parser.marc_spec).to parse('...[9]{$a}{$b|$c}', trace: true)
        end
        it 'position ten && one uppercase char two wildcards right' do
          expect(parser.marc_spec).to parse('...[9]{$a|$b}{$c|$d}', trace: true)
        end
        it 'position ten && mix one lowercase char and two digits' do
          expect(parser.marc_spec).to parse('...[9]{$a|$b|$c}', trace: true)
        end
        it 'position ten && mix two lowercase chars and one digit' do
          expect(parser.marc_spec).to parse('...[9]{$a~\\test\\$}', trace: true)
        end
        it 'position ten && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[9]{$a~\\test\\{}', trace: true)
        end
        it 'position ten && two wildcards and one lowercase char right' do
          expect(parser.marc_spec).to parse('...[9]{$a~\\test\\}}', trace: true)
        end
        it 'position ten && one wildcard left and two lowercase chars' do
          expect(parser.marc_spec).to parse('...[9]{$a~\\test\\!}', trace: true)
        end
        it 'position ten && one lowercase and two wildcards right' do
          expect(parser.marc_spec).to parse('...[9]{$a~\\test\\=}', trace: true)
        end
        it 'position ten && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[9]{$a~\\test\\~}', trace: true)
        end
        it 'position ten && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[9]{$a~\\test\\?}', trace: true)
        end
        it 'position ten && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[9]{$a~\\test\\|}', trace: true)
        end
        it 'position eleven && all wildcards' do
          expect(parser.marc_spec).to parse('...[10]{245$a}', trace: true)
        end
        it 'position eleven && two wildcards left with digit' do
          expect(parser.marc_spec).to parse('...[10]{$a}', trace: true)
        end
        it 'position eleven && one wildcard left with two digits' do
          expect(parser.marc_spec).to parse('...[10]{?$a}', trace: true)
        end
        it 'position eleven && wildcard between digits' do
          expect(parser.marc_spec).to parse('...[10]{!$a}', trace: true)
        end
        it 'position eleven && two digits wildcard right' do
          expect(parser.marc_spec).to parse('...[10]{$a=$b}', trace: true)
        end
        it 'position eleven && one digit two wildcards right' do
          expect(parser.marc_spec).to parse('...[10]{$a!=$b}', trace: true)
        end
        it 'position eleven && all digits' do
          expect(parser.marc_spec).to parse('...[10]{$a~\\Poe}', trace: true)
        end
        it 'position eleven && all uppercase chars special leader' do
          expect(parser.marc_spec).to parse('...[10]{$a!~\\Poe}', trace: true)
        end
        it 'position eleven && two wildcards left one uppercase char' do
          expect(parser.marc_spec).to parse('...[10]{/#=\\/}', trace: true)
        end
        it 'position eleven && one wildcard left two uppercase chars' do
          expect(parser.marc_spec).to parse('...[10]{$a|$b}{$c}', trace: true)
        end
        it 'position eleven && one wildcard between uppercase chars' do
          expect(parser.marc_spec).to parse('...[10]{$a}{$b|$c}', trace: true)
        end
        it 'position eleven && one uppercase char two wildcards right' do
          expect(parser.marc_spec).to parse('...[10]{$a|$b}{$c|$d}', trace: true)
        end
        it 'position eleven && mix one lowercase char and two digits' do
          expect(parser.marc_spec).to parse('...[10]{$a|$b|$c}', trace: true)
        end
        it 'position eleven && mix two lowercase chars and one digit' do
          expect(parser.marc_spec).to parse('...[10]{$a~\\test\\$}', trace: true)
        end
        it 'position eleven && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[10]{$a~\\test\\{}', trace: true)
        end
        it 'position eleven && two wildcards and one lowercase char right' do
          expect(parser.marc_spec).to parse('...[10]{$a~\\test\\}}', trace: true)
        end
        it 'position eleven && one wildcard left and two lowercase chars' do
          expect(parser.marc_spec).to parse('...[10]{$a~\\test\\!}', trace: true)
        end
        it 'position eleven && one lowercase and two wildcards right' do
          expect(parser.marc_spec).to parse('...[10]{$a~\\test\\=}', trace: true)
        end
        it 'position eleven && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[10]{$a~\\test\\~}', trace: true)
        end
        it 'position eleven && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[10]{$a~\\test\\?}', trace: true)
        end
        it 'position eleven && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[10]{$a~\\test\\|}', trace: true)
        end
        it 'position 101 && all wildcards' do
          expect(parser.marc_spec).to parse('...[100]{245$a}', trace: true)
        end
        it 'position 101 && two wildcards left with digit' do
          expect(parser.marc_spec).to parse('...[100]{$a}', trace: true)
        end
        it 'position 101 && one wildcard left with two digits' do
          expect(parser.marc_spec).to parse('...[100]{?$a}', trace: true)
        end
        it 'position 101 && wildcard between digits' do
          expect(parser.marc_spec).to parse('...[100]{!$a}', trace: true)
        end
        it 'position 101 && two digits wildcard right' do
          expect(parser.marc_spec).to parse('...[100]{$a=$b}', trace: true)
        end
        it 'position 101 && one digit two wildcards right' do
          expect(parser.marc_spec).to parse('...[100]{$a!=$b}', trace: true)
        end
        it 'position 101 && all digits' do
          expect(parser.marc_spec).to parse('...[100]{$a~\\Poe}', trace: true)
        end
        it 'position 101 && all uppercase chars special leader' do
          expect(parser.marc_spec).to parse('...[100]{$a!~\\Poe}', trace: true)
        end
        it 'position 101 && two wildcards left one uppercase char' do
          expect(parser.marc_spec).to parse('...[100]{/#=\\/}', trace: true)
        end
        it 'position 101 && one wildcard left two uppercase chars' do
          expect(parser.marc_spec).to parse('...[100]{$a|$b}{$c}', trace: true)
        end
        it 'position 101 && one wildcard between uppercase chars' do
          expect(parser.marc_spec).to parse('...[100]{$a}{$b|$c}', trace: true)
        end
        it 'position 101 && one uppercase char two wildcards right' do
          expect(parser.marc_spec).to parse('...[100]{$a|$b}{$c|$d}', trace: true)
        end
        it 'position 101 && mix one lowercase char and two digits' do
          expect(parser.marc_spec).to parse('...[100]{$a|$b|$c}', trace: true)
        end
        it 'position 101 && mix two lowercase chars and one digit' do
          expect(parser.marc_spec).to parse('...[100]{$a~\\test\\$}', trace: true)
        end
        it 'position 101 && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[100]{$a~\\test\\{}', trace: true)
        end
        it 'position 101 && two wildcards and one lowercase char right' do
          expect(parser.marc_spec).to parse('...[100]{$a~\\test\\}}', trace: true)
        end
        it 'position 101 && one wildcard left and two lowercase chars' do
          expect(parser.marc_spec).to parse('...[100]{$a~\\test\\!}', trace: true)
        end
        it 'position 101 && one lowercase and two wildcards right' do
          expect(parser.marc_spec).to parse('...[100]{$a~\\test\\=}', trace: true)
        end
        it 'position 101 && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[100]{$a~\\test\\~}', trace: true)
        end
        it 'position 101 && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[100]{$a~\\test\\?}', trace: true)
        end
        it 'position 101 && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[100]{$a~\\test\\|}', trace: true)
        end
        it 'range from first position to second && all wildcards' do
          expect(parser.marc_spec).to parse('...[0-1]{245$a}', trace: true)
        end
        it 'range from first position to second && two wildcards left with digit' do
          expect(parser.marc_spec).to parse('...[0-1]{$a}', trace: true)
        end
        it 'range from first position to second && one wildcard left with two digits' do
          expect(parser.marc_spec).to parse('...[0-1]{?$a}', trace: true)
        end
        it 'range from first position to second && wildcard between digits' do
          expect(parser.marc_spec).to parse('...[0-1]{!$a}', trace: true)
        end
        it 'range from first position to second && two digits wildcard right' do
          expect(parser.marc_spec).to parse('...[0-1]{$a=$b}', trace: true)
        end
        it 'range from first position to second && one digit two wildcards right' do
          expect(parser.marc_spec).to parse('...[0-1]{$a!=$b}', trace: true)
        end
        it 'range from first position to second && all digits' do
          expect(parser.marc_spec).to parse('...[0-1]{$a~\\Poe}', trace: true)
        end
        it 'range from first position to second && all uppercase chars special leader' do
          expect(parser.marc_spec).to parse('...[0-1]{$a!~\\Poe}', trace: true)
        end
        it 'range from first position to second && two wildcards left one uppercase char' do
          expect(parser.marc_spec).to parse('...[0-1]{/#=\\/}', trace: true)
        end
        it 'range from first position to second && one wildcard left two uppercase chars' do
          expect(parser.marc_spec).to parse('...[0-1]{$a|$b}{$c}', trace: true)
        end
        it 'range from first position to second && one wildcard between uppercase chars' do
          expect(parser.marc_spec).to parse('...[0-1]{$a}{$b|$c}', trace: true)
        end
        it 'range from first position to second && one uppercase char two wildcards right' do
          expect(parser.marc_spec).to parse('...[0-1]{$a|$b}{$c|$d}', trace: true)
        end
        it 'range from first position to second && mix one lowercase char and two digits' do
          expect(parser.marc_spec).to parse('...[0-1]{$a|$b|$c}', trace: true)
        end
        it 'range from first position to second && mix two lowercase chars and one digit' do
          expect(parser.marc_spec).to parse('...[0-1]{$a~\\test\\$}', trace: true)
        end
        it 'range from first position to second && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[0-1]{$a~\\test\\{}', trace: true)
        end
        it 'range from first position to second && two wildcards and one lowercase char right' do
          expect(parser.marc_spec).to parse('...[0-1]{$a~\\test\\}}', trace: true)
        end
        it 'range from first position to second && one wildcard left and two lowercase chars' do
          expect(parser.marc_spec).to parse('...[0-1]{$a~\\test\\!}', trace: true)
        end
        it 'range from first position to second && one lowercase and two wildcards right' do
          expect(parser.marc_spec).to parse('...[0-1]{$a~\\test\\=}', trace: true)
        end
        it 'range from first position to second && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[0-1]{$a~\\test\\~}', trace: true)
        end
        it 'range from first position to second && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[0-1]{$a~\\test\\?}', trace: true)
        end
        it 'range from first position to second && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[0-1]{$a~\\test\\|}', trace: true)
        end
        it 'range from first position to last && all wildcards' do
          expect(parser.marc_spec).to parse('...[0-#]{245$a}', trace: true)
        end
        it 'range from first position to last && two wildcards left with digit' do
          expect(parser.marc_spec).to parse('...[0-#]{$a}', trace: true)
        end
        it 'range from first position to last && one wildcard left with two digits' do
          expect(parser.marc_spec).to parse('...[0-#]{?$a}', trace: true)
        end
        it 'range from first position to last && wildcard between digits' do
          expect(parser.marc_spec).to parse('...[0-#]{!$a}', trace: true)
        end
        it 'range from first position to last && two digits wildcard right' do
          expect(parser.marc_spec).to parse('...[0-#]{$a=$b}', trace: true)
        end
        it 'range from first position to last && one digit two wildcards right' do
          expect(parser.marc_spec).to parse('...[0-#]{$a!=$b}', trace: true)
        end
        it 'range from first position to last && all digits' do
          expect(parser.marc_spec).to parse('...[0-#]{$a~\\Poe}', trace: true)
        end
        it 'range from first position to last && all uppercase chars special leader' do
          expect(parser.marc_spec).to parse('...[0-#]{$a!~\\Poe}', trace: true)
        end
        it 'range from first position to last && two wildcards left one uppercase char' do
          expect(parser.marc_spec).to parse('...[0-#]{/#=\\/}', trace: true)
        end
        it 'range from first position to last && one wildcard left two uppercase chars' do
          expect(parser.marc_spec).to parse('...[0-#]{$a|$b}{$c}', trace: true)
        end
        it 'range from first position to last && one wildcard between uppercase chars' do
          expect(parser.marc_spec).to parse('...[0-#]{$a}{$b|$c}', trace: true)
        end
        it 'range from first position to last && one uppercase char two wildcards right' do
          expect(parser.marc_spec).to parse('...[0-#]{$a|$b}{$c|$d}', trace: true)
        end
        it 'range from first position to last && mix one lowercase char and two digits' do
          expect(parser.marc_spec).to parse('...[0-#]{$a|$b|$c}', trace: true)
        end
        it 'range from first position to last && mix two lowercase chars and one digit' do
          expect(parser.marc_spec).to parse('...[0-#]{$a~\\test\\$}', trace: true)
        end
        it 'range from first position to last && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[0-#]{$a~\\test\\{}', trace: true)
        end
        it 'range from first position to last && two wildcards and one lowercase char right' do
          expect(parser.marc_spec).to parse('...[0-#]{$a~\\test\\}}', trace: true)
        end
        it 'range from first position to last && one wildcard left and two lowercase chars' do
          expect(parser.marc_spec).to parse('...[0-#]{$a~\\test\\!}', trace: true)
        end
        it 'range from first position to last && one lowercase and two wildcards right' do
          expect(parser.marc_spec).to parse('...[0-#]{$a~\\test\\=}', trace: true)
        end
        it 'range from first position to last && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[0-#]{$a~\\test\\~}', trace: true)
        end
        it 'range from first position to last && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[0-#]{$a~\\test\\?}', trace: true)
        end
        it 'range from first position to last && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[0-#]{$a~\\test\\|}', trace: true)
        end
        it 'range from first position to first position, is like first position && all wildcards' do
          expect(parser.marc_spec).to parse('...[0-0]{245$a}', trace: true)
        end
        it 'range from first position to first position, is like first position && two wildcards left with digit' do
          expect(parser.marc_spec).to parse('...[0-0]{$a}', trace: true)
        end
        it 'range from first position to first position, is like first position && one wildcard left with two digits' do
          expect(parser.marc_spec).to parse('...[0-0]{?$a}', trace: true)
        end
        it 'range from first position to first position, is like first position && wildcard between digits' do
          expect(parser.marc_spec).to parse('...[0-0]{!$a}', trace: true)
        end
        it 'range from first position to first position, is like first position && two digits wildcard right' do
          expect(parser.marc_spec).to parse('...[0-0]{$a=$b}', trace: true)
        end
        it 'range from first position to first position, is like first position && one digit two wildcards right' do
          expect(parser.marc_spec).to parse('...[0-0]{$a!=$b}', trace: true)
        end
        it 'range from first position to first position, is like first position && all digits' do
          expect(parser.marc_spec).to parse('...[0-0]{$a~\\Poe}', trace: true)
        end
        it 'range from first position to first position, is like first position && all uppercase chars special leader' do
          expect(parser.marc_spec).to parse('...[0-0]{$a!~\\Poe}', trace: true)
        end
        it 'range from first position to first position, is like first position && two wildcards left one uppercase char' do
          expect(parser.marc_spec).to parse('...[0-0]{/#=\\/}', trace: true)
        end
        it 'range from first position to first position, is like first position && one wildcard left two uppercase chars' do
          expect(parser.marc_spec).to parse('...[0-0]{$a|$b}{$c}', trace: true)
        end
        it 'range from first position to first position, is like first position && one wildcard between uppercase chars' do
          expect(parser.marc_spec).to parse('...[0-0]{$a}{$b|$c}', trace: true)
        end
        it 'range from first position to first position, is like first position && one uppercase char two wildcards right' do
          expect(parser.marc_spec).to parse('...[0-0]{$a|$b}{$c|$d}', trace: true)
        end
        it 'range from first position to first position, is like first position && mix one lowercase char and two digits' do
          expect(parser.marc_spec).to parse('...[0-0]{$a|$b|$c}', trace: true)
        end
        it 'range from first position to first position, is like first position && mix two lowercase chars and one digit' do
          expect(parser.marc_spec).to parse('...[0-0]{$a~\\test\\$}', trace: true)
        end
        it 'range from first position to first position, is like first position && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[0-0]{$a~\\test\\{}', trace: true)
        end
        it 'range from first position to first position, is like first position && two wildcards and one lowercase char right' do
          expect(parser.marc_spec).to parse('...[0-0]{$a~\\test\\}}', trace: true)
        end
        it 'range from first position to first position, is like first position && one wildcard left and two lowercase chars' do
          expect(parser.marc_spec).to parse('...[0-0]{$a~\\test\\!}', trace: true)
        end
        it 'range from first position to first position, is like first position && one lowercase and two wildcards right' do
          expect(parser.marc_spec).to parse('...[0-0]{$a~\\test\\=}', trace: true)
        end
        it 'range from first position to first position, is like first position && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[0-0]{$a~\\test\\~}', trace: true)
        end
        it 'range from first position to first position, is like first position && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[0-0]{$a~\\test\\?}', trace: true)
        end
        it 'range from first position to first position, is like first position && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[0-0]{$a~\\test\\|}', trace: true)
        end
        it 'range from last position to last position, is like last position && all wildcards' do
          expect(parser.marc_spec).to parse('...[#-#]{245$a}', trace: true)
        end
        it 'range from last position to last position, is like last position && two wildcards left with digit' do
          expect(parser.marc_spec).to parse('...[#-#]{$a}', trace: true)
        end
        it 'range from last position to last position, is like last position && one wildcard left with two digits' do
          expect(parser.marc_spec).to parse('...[#-#]{?$a}', trace: true)
        end
        it 'range from last position to last position, is like last position && wildcard between digits' do
          expect(parser.marc_spec).to parse('...[#-#]{!$a}', trace: true)
        end
        it 'range from last position to last position, is like last position && two digits wildcard right' do
          expect(parser.marc_spec).to parse('...[#-#]{$a=$b}', trace: true)
        end
        it 'range from last position to last position, is like last position && one digit two wildcards right' do
          expect(parser.marc_spec).to parse('...[#-#]{$a!=$b}', trace: true)
        end
        it 'range from last position to last position, is like last position && all digits' do
          expect(parser.marc_spec).to parse('...[#-#]{$a~\\Poe}', trace: true)
        end
        it 'range from last position to last position, is like last position && all uppercase chars special leader' do
          expect(parser.marc_spec).to parse('...[#-#]{$a!~\\Poe}', trace: true)
        end
        it 'range from last position to last position, is like last position && two wildcards left one uppercase char' do
          expect(parser.marc_spec).to parse('...[#-#]{/#=\\/}', trace: true)
        end
        it 'range from last position to last position, is like last position && one wildcard left two uppercase chars' do
          expect(parser.marc_spec).to parse('...[#-#]{$a|$b}{$c}', trace: true)
        end
        it 'range from last position to last position, is like last position && one wildcard between uppercase chars' do
          expect(parser.marc_spec).to parse('...[#-#]{$a}{$b|$c}', trace: true)
        end
        it 'range from last position to last position, is like last position && one uppercase char two wildcards right' do
          expect(parser.marc_spec).to parse('...[#-#]{$a|$b}{$c|$d}', trace: true)
        end
        it 'range from last position to last position, is like last position && mix one lowercase char and two digits' do
          expect(parser.marc_spec).to parse('...[#-#]{$a|$b|$c}', trace: true)
        end
        it 'range from last position to last position, is like last position && mix two lowercase chars and one digit' do
          expect(parser.marc_spec).to parse('...[#-#]{$a~\\test\\$}', trace: true)
        end
        it 'range from last position to last position, is like last position && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[#-#]{$a~\\test\\{}', trace: true)
        end
        it 'range from last position to last position, is like last position && two wildcards and one lowercase char right' do
          expect(parser.marc_spec).to parse('...[#-#]{$a~\\test\\}}', trace: true)
        end
        it 'range from last position to last position, is like last position && one wildcard left and two lowercase chars' do
          expect(parser.marc_spec).to parse('...[#-#]{$a~\\test\\!}', trace: true)
        end
        it 'range from last position to last position, is like last position && one lowercase and two wildcards right' do
          expect(parser.marc_spec).to parse('...[#-#]{$a~\\test\\=}', trace: true)
        end
        it 'range from last position to last position, is like last position && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[#-#]{$a~\\test\\~}', trace: true)
        end
        it 'range from last position to last position, is like last position && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[#-#]{$a~\\test\\?}', trace: true)
        end
        it 'range from last position to last position, is like last position && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[#-#]{$a~\\test\\|}', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && all wildcards' do
          expect(parser.marc_spec).to parse('...[#-0]{245$a}', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && two wildcards left with digit' do
          expect(parser.marc_spec).to parse('...[#-0]{$a}', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && one wildcard left with two digits' do
          expect(parser.marc_spec).to parse('...[#-0]{?$a}', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && wildcard between digits' do
          expect(parser.marc_spec).to parse('...[#-0]{!$a}', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && two digits wildcard right' do
          expect(parser.marc_spec).to parse('...[#-0]{$a=$b}', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && one digit two wildcards right' do
          expect(parser.marc_spec).to parse('...[#-0]{$a!=$b}', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && all digits' do
          expect(parser.marc_spec).to parse('...[#-0]{$a~\\Poe}', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && all uppercase chars special leader' do
          expect(parser.marc_spec).to parse('...[#-0]{$a!~\\Poe}', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && two wildcards left one uppercase char' do
          expect(parser.marc_spec).to parse('...[#-0]{/#=\\/}', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && one wildcard left two uppercase chars' do
          expect(parser.marc_spec).to parse('...[#-0]{$a|$b}{$c}', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && one wildcard between uppercase chars' do
          expect(parser.marc_spec).to parse('...[#-0]{$a}{$b|$c}', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && one uppercase char two wildcards right' do
          expect(parser.marc_spec).to parse('...[#-0]{$a|$b}{$c|$d}', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && mix one lowercase char and two digits' do
          expect(parser.marc_spec).to parse('...[#-0]{$a|$b|$c}', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && mix two lowercase chars and one digit' do
          expect(parser.marc_spec).to parse('...[#-0]{$a~\\test\\$}', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[#-0]{$a~\\test\\{}', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && two wildcards and one lowercase char right' do
          expect(parser.marc_spec).to parse('...[#-0]{$a~\\test\\}}', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && one wildcard left and two lowercase chars' do
          expect(parser.marc_spec).to parse('...[#-0]{$a~\\test\\!}', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && one lowercase and two wildcards right' do
          expect(parser.marc_spec).to parse('...[#-0]{$a~\\test\\=}', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[#-0]{$a~\\test\\~}', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[#-0]{$a~\\test\\?}', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[#-0]{$a~\\test\\|}', trace: true)
        end
        it 'range from last position to position two (index reverted) && all wildcards' do
          expect(parser.marc_spec).to parse('...[#-1]{245$a}', trace: true)
        end
        it 'range from last position to position two (index reverted) && two wildcards left with digit' do
          expect(parser.marc_spec).to parse('...[#-1]{$a}', trace: true)
        end
        it 'range from last position to position two (index reverted) && one wildcard left with two digits' do
          expect(parser.marc_spec).to parse('...[#-1]{?$a}', trace: true)
        end
        it 'range from last position to position two (index reverted) && wildcard between digits' do
          expect(parser.marc_spec).to parse('...[#-1]{!$a}', trace: true)
        end
        it 'range from last position to position two (index reverted) && two digits wildcard right' do
          expect(parser.marc_spec).to parse('...[#-1]{$a=$b}', trace: true)
        end
        it 'range from last position to position two (index reverted) && one digit two wildcards right' do
          expect(parser.marc_spec).to parse('...[#-1]{$a!=$b}', trace: true)
        end
        it 'range from last position to position two (index reverted) && all digits' do
          expect(parser.marc_spec).to parse('...[#-1]{$a~\\Poe}', trace: true)
        end
        it 'range from last position to position two (index reverted) && all uppercase chars special leader' do
          expect(parser.marc_spec).to parse('...[#-1]{$a!~\\Poe}', trace: true)
        end
        it 'range from last position to position two (index reverted) && two wildcards left one uppercase char' do
          expect(parser.marc_spec).to parse('...[#-1]{/#=\\/}', trace: true)
        end
        it 'range from last position to position two (index reverted) && one wildcard left two uppercase chars' do
          expect(parser.marc_spec).to parse('...[#-1]{$a|$b}{$c}', trace: true)
        end
        it 'range from last position to position two (index reverted) && one wildcard between uppercase chars' do
          expect(parser.marc_spec).to parse('...[#-1]{$a}{$b|$c}', trace: true)
        end
        it 'range from last position to position two (index reverted) && one uppercase char two wildcards right' do
          expect(parser.marc_spec).to parse('...[#-1]{$a|$b}{$c|$d}', trace: true)
        end
        it 'range from last position to position two (index reverted) && mix one lowercase char and two digits' do
          expect(parser.marc_spec).to parse('...[#-1]{$a|$b|$c}', trace: true)
        end
        it 'range from last position to position two (index reverted) && mix two lowercase chars and one digit' do
          expect(parser.marc_spec).to parse('...[#-1]{$a~\\test\\$}', trace: true)
        end
        it 'range from last position to position two (index reverted) && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[#-1]{$a~\\test\\{}', trace: true)
        end
        it 'range from last position to position two (index reverted) && two wildcards and one lowercase char right' do
          expect(parser.marc_spec).to parse('...[#-1]{$a~\\test\\}}', trace: true)
        end
        it 'range from last position to position two (index reverted) && one wildcard left and two lowercase chars' do
          expect(parser.marc_spec).to parse('...[#-1]{$a~\\test\\!}', trace: true)
        end
        it 'range from last position to position two (index reverted) && one lowercase and two wildcards right' do
          expect(parser.marc_spec).to parse('...[#-1]{$a~\\test\\=}', trace: true)
        end
        it 'range from last position to position two (index reverted) && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[#-1]{$a~\\test\\~}', trace: true)
        end
        it 'range from last position to position two (index reverted) && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[#-1]{$a~\\test\\?}', trace: true)
        end
        it 'range from last position to position two (index reverted) && all lowercase chars' do
          expect(parser.marc_spec).to parse('...[#-1]{$a~\\test\\|}', trace: true)
        end
      end
    end
  end
end
