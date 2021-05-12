require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve, RubyParenthesesAfterMethodCallInspection
module MARC
  module Spec
    describe :wild_sub_spec_sub_spec do
      let(:parser) { Parser.new }

      describe 'wild combination of valid field tag and subspecs (valid)' do
        it 'all wildcards && all wildcards (valid)' do
          expect(parser.marc_spec).to parse('...{245$a}{245$a}', trace: true)
        end
        it 'all wildcards && two wildcards left with digit (valid)' do
          expect(parser.marc_spec).to parse('...{245$a}{$a}', trace: true)
        end
        it 'all wildcards && one wildcard left with two digits (valid)' do
          expect(parser.marc_spec).to parse('...{245$a}{?$a}', trace: true)
        end
        it 'all wildcards && wildcard between digits (valid)' do
          expect(parser.marc_spec).to parse('...{245$a}{!$a}', trace: true)
        end
        it 'all wildcards && two digits wildcard right (valid)' do
          expect(parser.marc_spec).to parse('...{245$a}{$a=$b}', trace: true)
        end
        it 'all wildcards && one digit two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{245$a}{$a!=$b}', trace: true)
        end
        it 'all wildcards && all digits (valid)' do
          expect(parser.marc_spec).to parse('...{245$a}{$a~\\Poe}', trace: true)
        end
        it 'all wildcards && all uppercase chars special leader (valid)' do
          expect(parser.marc_spec).to parse('...{245$a}{$a!~\\Poe}', trace: true)
        end
        it 'all wildcards && two wildcards left one uppercase char (valid)' do
          expect(parser.marc_spec).to parse('...{245$a}{/#=\\/}', trace: true)
        end
        it 'all wildcards && one wildcard left two uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{245$a}{$a|$b}{$c}', trace: true)
        end
        it 'all wildcards && one wildcard between uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{245$a}{$a}{$b|$c}', trace: true)
        end
        it 'all wildcards && one uppercase char two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{245$a}{$a|$b}{$c|$d}', trace: true)
        end
        it 'all wildcards && mix one lowercase char and two digits (valid)' do
          expect(parser.marc_spec).to parse('...{245$a}{$a|$b|$c}', trace: true)
        end
        it 'all wildcards && mix two lowercase chars and one digit (valid)' do
          expect(parser.marc_spec).to parse('...{245$a}{$a~\\test\\$}', trace: true)
        end
        it 'all wildcards && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{245$a}{$a~\\test\\{}', trace: true)
        end
        it 'all wildcards && two wildcards and one lowercase char right (valid)' do
          expect(parser.marc_spec).to parse('...{245$a}{$a~\\test\\}}', trace: true)
        end
        it 'all wildcards && one wildcard left and two lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{245$a}{$a~\\test\\!}', trace: true)
        end
        it 'all wildcards && one lowercase and two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{245$a}{$a~\\test\\=}', trace: true)
        end
        it 'all wildcards && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{245$a}{$a~\\test\\~}', trace: true)
        end
        it 'all wildcards && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{245$a}{$a~\\test\\?}', trace: true)
        end
        it 'all wildcards && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{245$a}{$a~\\test\\|}', trace: true)
        end
        it 'two wildcards left with digit && all wildcards (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{245$a}', trace: true)
        end
        it 'two wildcards left with digit && two wildcards left with digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$a}', trace: true)
        end
        it 'two wildcards left with digit && one wildcard left with two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{?$a}', trace: true)
        end
        it 'two wildcards left with digit && wildcard between digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{!$a}', trace: true)
        end
        it 'two wildcards left with digit && two digits wildcard right (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$a=$b}', trace: true)
        end
        it 'two wildcards left with digit && one digit two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$a!=$b}', trace: true)
        end
        it 'two wildcards left with digit && all digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$a~\\Poe}', trace: true)
        end
        it 'two wildcards left with digit && all uppercase chars special leader (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$a!~\\Poe}', trace: true)
        end
        it 'two wildcards left with digit && two wildcards left one uppercase char (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{/#=\\/}', trace: true)
        end
        it 'two wildcards left with digit && one wildcard left two uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$a|$b}{$c}', trace: true)
        end
        it 'two wildcards left with digit && one wildcard between uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$a}{$b|$c}', trace: true)
        end
        it 'two wildcards left with digit && one uppercase char two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$a|$b}{$c|$d}', trace: true)
        end
        it 'two wildcards left with digit && mix one lowercase char and two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$a|$b|$c}', trace: true)
        end
        it 'two wildcards left with digit && mix two lowercase chars and one digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$a~\\test\\$}', trace: true)
        end
        it 'two wildcards left with digit && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$a~\\test\\{}', trace: true)
        end
        it 'two wildcards left with digit && two wildcards and one lowercase char right (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$a~\\test\\}}', trace: true)
        end
        it 'two wildcards left with digit && one wildcard left and two lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$a~\\test\\!}', trace: true)
        end
        it 'two wildcards left with digit && one lowercase and two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$a~\\test\\=}', trace: true)
        end
        it 'two wildcards left with digit && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$a~\\test\\~}', trace: true)
        end
        it 'two wildcards left with digit && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$a~\\test\\?}', trace: true)
        end
        it 'two wildcards left with digit && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$a~\\test\\|}', trace: true)
        end
        it 'one wildcard left with two digits && all wildcards (valid)' do
          expect(parser.marc_spec).to parse('...{?$a}{245$a}', trace: true)
        end
        it 'one wildcard left with two digits && two wildcards left with digit (valid)' do
          expect(parser.marc_spec).to parse('...{?$a}{$a}', trace: true)
        end
        it 'one wildcard left with two digits && one wildcard left with two digits (valid)' do
          expect(parser.marc_spec).to parse('...{?$a}{?$a}', trace: true)
        end
        it 'one wildcard left with two digits && wildcard between digits (valid)' do
          expect(parser.marc_spec).to parse('...{?$a}{!$a}', trace: true)
        end
        it 'one wildcard left with two digits && two digits wildcard right (valid)' do
          expect(parser.marc_spec).to parse('...{?$a}{$a=$b}', trace: true)
        end
        it 'one wildcard left with two digits && one digit two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{?$a}{$a!=$b}', trace: true)
        end
        it 'one wildcard left with two digits && all digits (valid)' do
          expect(parser.marc_spec).to parse('...{?$a}{$a~\\Poe}', trace: true)
        end
        it 'one wildcard left with two digits && all uppercase chars special leader (valid)' do
          expect(parser.marc_spec).to parse('...{?$a}{$a!~\\Poe}', trace: true)
        end
        it 'one wildcard left with two digits && two wildcards left one uppercase char (valid)' do
          expect(parser.marc_spec).to parse('...{?$a}{/#=\\/}', trace: true)
        end
        it 'one wildcard left with two digits && one wildcard left two uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{?$a}{$a|$b}{$c}', trace: true)
        end
        it 'one wildcard left with two digits && one wildcard between uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{?$a}{$a}{$b|$c}', trace: true)
        end
        it 'one wildcard left with two digits && one uppercase char two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{?$a}{$a|$b}{$c|$d}', trace: true)
        end
        it 'one wildcard left with two digits && mix one lowercase char and two digits (valid)' do
          expect(parser.marc_spec).to parse('...{?$a}{$a|$b|$c}', trace: true)
        end
        it 'one wildcard left with two digits && mix two lowercase chars and one digit (valid)' do
          expect(parser.marc_spec).to parse('...{?$a}{$a~\\test\\$}', trace: true)
        end
        it 'one wildcard left with two digits && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{?$a}{$a~\\test\\{}', trace: true)
        end
        it 'one wildcard left with two digits && two wildcards and one lowercase char right (valid)' do
          expect(parser.marc_spec).to parse('...{?$a}{$a~\\test\\}}', trace: true)
        end
        it 'one wildcard left with two digits && one wildcard left and two lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{?$a}{$a~\\test\\!}', trace: true)
        end
        it 'one wildcard left with two digits && one lowercase and two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{?$a}{$a~\\test\\=}', trace: true)
        end
        it 'one wildcard left with two digits && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{?$a}{$a~\\test\\~}', trace: true)
        end
        it 'one wildcard left with two digits && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{?$a}{$a~\\test\\?}', trace: true)
        end
        it 'one wildcard left with two digits && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{?$a}{$a~\\test\\|}', trace: true)
        end
        it 'wildcard between digits && all wildcards (valid)' do
          expect(parser.marc_spec).to parse('...{!$a}{245$a}', trace: true)
        end
        it 'wildcard between digits && two wildcards left with digit (valid)' do
          expect(parser.marc_spec).to parse('...{!$a}{$a}', trace: true)
        end
        it 'wildcard between digits && one wildcard left with two digits (valid)' do
          expect(parser.marc_spec).to parse('...{!$a}{?$a}', trace: true)
        end
        it 'wildcard between digits && wildcard between digits (valid)' do
          expect(parser.marc_spec).to parse('...{!$a}{!$a}', trace: true)
        end
        it 'wildcard between digits && two digits wildcard right (valid)' do
          expect(parser.marc_spec).to parse('...{!$a}{$a=$b}', trace: true)
        end
        it 'wildcard between digits && one digit two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{!$a}{$a!=$b}', trace: true)
        end
        it 'wildcard between digits && all digits (valid)' do
          expect(parser.marc_spec).to parse('...{!$a}{$a~\\Poe}', trace: true)
        end
        it 'wildcard between digits && all uppercase chars special leader (valid)' do
          expect(parser.marc_spec).to parse('...{!$a}{$a!~\\Poe}', trace: true)
        end
        it 'wildcard between digits && two wildcards left one uppercase char (valid)' do
          expect(parser.marc_spec).to parse('...{!$a}{/#=\\/}', trace: true)
        end
        it 'wildcard between digits && one wildcard left two uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{!$a}{$a|$b}{$c}', trace: true)
        end
        it 'wildcard between digits && one wildcard between uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{!$a}{$a}{$b|$c}', trace: true)
        end
        it 'wildcard between digits && one uppercase char two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{!$a}{$a|$b}{$c|$d}', trace: true)
        end
        it 'wildcard between digits && mix one lowercase char and two digits (valid)' do
          expect(parser.marc_spec).to parse('...{!$a}{$a|$b|$c}', trace: true)
        end
        it 'wildcard between digits && mix two lowercase chars and one digit (valid)' do
          expect(parser.marc_spec).to parse('...{!$a}{$a~\\test\\$}', trace: true)
        end
        it 'wildcard between digits && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{!$a}{$a~\\test\\{}', trace: true)
        end
        it 'wildcard between digits && two wildcards and one lowercase char right (valid)' do
          expect(parser.marc_spec).to parse('...{!$a}{$a~\\test\\}}', trace: true)
        end
        it 'wildcard between digits && one wildcard left and two lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{!$a}{$a~\\test\\!}', trace: true)
        end
        it 'wildcard between digits && one lowercase and two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{!$a}{$a~\\test\\=}', trace: true)
        end
        it 'wildcard between digits && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{!$a}{$a~\\test\\~}', trace: true)
        end
        it 'wildcard between digits && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{!$a}{$a~\\test\\?}', trace: true)
        end
        it 'wildcard between digits && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{!$a}{$a~\\test\\|}', trace: true)
        end
        it 'two digits wildcard right && all wildcards (valid)' do
          expect(parser.marc_spec).to parse('...{$a=$b}{245$a}', trace: true)
        end
        it 'two digits wildcard right && two wildcards left with digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a=$b}{$a}', trace: true)
        end
        it 'two digits wildcard right && one wildcard left with two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a=$b}{?$a}', trace: true)
        end
        it 'two digits wildcard right && wildcard between digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a=$b}{!$a}', trace: true)
        end
        it 'two digits wildcard right && two digits wildcard right (valid)' do
          expect(parser.marc_spec).to parse('...{$a=$b}{$a=$b}', trace: true)
        end
        it 'two digits wildcard right && one digit two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a=$b}{$a!=$b}', trace: true)
        end
        it 'two digits wildcard right && all digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a=$b}{$a~\\Poe}', trace: true)
        end
        it 'two digits wildcard right && all uppercase chars special leader (valid)' do
          expect(parser.marc_spec).to parse('...{$a=$b}{$a!~\\Poe}', trace: true)
        end
        it 'two digits wildcard right && two wildcards left one uppercase char (valid)' do
          expect(parser.marc_spec).to parse('...{$a=$b}{/#=\\/}', trace: true)
        end
        it 'two digits wildcard right && one wildcard left two uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a=$b}{$a|$b}{$c}', trace: true)
        end
        it 'two digits wildcard right && one wildcard between uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a=$b}{$a}{$b|$c}', trace: true)
        end
        it 'two digits wildcard right && one uppercase char two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a=$b}{$a|$b}{$c|$d}', trace: true)
        end
        it 'two digits wildcard right && mix one lowercase char and two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a=$b}{$a|$b|$c}', trace: true)
        end
        it 'two digits wildcard right && mix two lowercase chars and one digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a=$b}{$a~\\test\\$}', trace: true)
        end
        it 'two digits wildcard right && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a=$b}{$a~\\test\\{}', trace: true)
        end
        it 'two digits wildcard right && two wildcards and one lowercase char right (valid)' do
          expect(parser.marc_spec).to parse('...{$a=$b}{$a~\\test\\}}', trace: true)
        end
        it 'two digits wildcard right && one wildcard left and two lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a=$b}{$a~\\test\\!}', trace: true)
        end
        it 'two digits wildcard right && one lowercase and two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a=$b}{$a~\\test\\=}', trace: true)
        end
        it 'two digits wildcard right && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a=$b}{$a~\\test\\~}', trace: true)
        end
        it 'two digits wildcard right && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a=$b}{$a~\\test\\?}', trace: true)
        end
        it 'two digits wildcard right && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a=$b}{$a~\\test\\|}', trace: true)
        end
        it 'one digit two wildcards right && all wildcards (valid)' do
          expect(parser.marc_spec).to parse('...{$a!=$b}{245$a}', trace: true)
        end
        it 'one digit two wildcards right && two wildcards left with digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a!=$b}{$a}', trace: true)
        end
        it 'one digit two wildcards right && one wildcard left with two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a!=$b}{?$a}', trace: true)
        end
        it 'one digit two wildcards right && wildcard between digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a!=$b}{!$a}', trace: true)
        end
        it 'one digit two wildcards right && two digits wildcard right (valid)' do
          expect(parser.marc_spec).to parse('...{$a!=$b}{$a=$b}', trace: true)
        end
        it 'one digit two wildcards right && one digit two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a!=$b}{$a!=$b}', trace: true)
        end
        it 'one digit two wildcards right && all digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a!=$b}{$a~\\Poe}', trace: true)
        end
        it 'one digit two wildcards right && all uppercase chars special leader (valid)' do
          expect(parser.marc_spec).to parse('...{$a!=$b}{$a!~\\Poe}', trace: true)
        end
        it 'one digit two wildcards right && two wildcards left one uppercase char (valid)' do
          expect(parser.marc_spec).to parse('...{$a!=$b}{/#=\\/}', trace: true)
        end
        it 'one digit two wildcards right && one wildcard left two uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a!=$b}{$a|$b}{$c}', trace: true)
        end
        it 'one digit two wildcards right && one wildcard between uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a!=$b}{$a}{$b|$c}', trace: true)
        end
        it 'one digit two wildcards right && one uppercase char two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a!=$b}{$a|$b}{$c|$d}', trace: true)
        end
        it 'one digit two wildcards right && mix one lowercase char and two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a!=$b}{$a|$b|$c}', trace: true)
        end
        it 'one digit two wildcards right && mix two lowercase chars and one digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a!=$b}{$a~\\test\\$}', trace: true)
        end
        it 'one digit two wildcards right && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a!=$b}{$a~\\test\\{}', trace: true)
        end
        it 'one digit two wildcards right && two wildcards and one lowercase char right (valid)' do
          expect(parser.marc_spec).to parse('...{$a!=$b}{$a~\\test\\}}', trace: true)
        end
        it 'one digit two wildcards right && one wildcard left and two lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a!=$b}{$a~\\test\\!}', trace: true)
        end
        it 'one digit two wildcards right && one lowercase and two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a!=$b}{$a~\\test\\=}', trace: true)
        end
        it 'one digit two wildcards right && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a!=$b}{$a~\\test\\~}', trace: true)
        end
        it 'one digit two wildcards right && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a!=$b}{$a~\\test\\?}', trace: true)
        end
        it 'one digit two wildcards right && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a!=$b}{$a~\\test\\|}', trace: true)
        end
        it 'all digits && all wildcards (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\Poe}{245$a}', trace: true)
        end
        it 'all digits && two wildcards left with digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a}', trace: true)
        end
        it 'all digits && one wildcard left with two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\Poe}{?$a}', trace: true)
        end
        it 'all digits && wildcard between digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\Poe}{!$a}', trace: true)
        end
        it 'all digits && two digits wildcard right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a=$b}', trace: true)
        end
        it 'all digits && one digit two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a!=$b}', trace: true)
        end
        it 'all digits && all digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a~\\Poe}', trace: true)
        end
        it 'all digits && all uppercase chars special leader (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a!~\\Poe}', trace: true)
        end
        it 'all digits && two wildcards left one uppercase char (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\Poe}{/#=\\/}', trace: true)
        end
        it 'all digits && one wildcard left two uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a|$b}{$c}', trace: true)
        end
        it 'all digits && one wildcard between uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a}{$b|$c}', trace: true)
        end
        it 'all digits && one uppercase char two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a|$b}{$c|$d}', trace: true)
        end
        it 'all digits && mix one lowercase char and two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a|$b|$c}', trace: true)
        end
        it 'all digits && mix two lowercase chars and one digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a~\\test\\$}', trace: true)
        end
        it 'all digits && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a~\\test\\{}', trace: true)
        end
        it 'all digits && two wildcards and one lowercase char right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a~\\test\\}}', trace: true)
        end
        it 'all digits && one wildcard left and two lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a~\\test\\!}', trace: true)
        end
        it 'all digits && one lowercase and two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a~\\test\\=}', trace: true)
        end
        it 'all digits && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a~\\test\\~}', trace: true)
        end
        it 'all digits && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a~\\test\\?}', trace: true)
        end
        it 'all digits && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\Poe}{$a~\\test\\|}', trace: true)
        end
        it 'all uppercase chars special leader && all wildcards (valid)' do
          expect(parser.marc_spec).to parse('...{$a!~\\Poe}{245$a}', trace: true)
        end
        it 'all uppercase chars special leader && two wildcards left with digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a}', trace: true)
        end
        it 'all uppercase chars special leader && one wildcard left with two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a!~\\Poe}{?$a}', trace: true)
        end
        it 'all uppercase chars special leader && wildcard between digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a!~\\Poe}{!$a}', trace: true)
        end
        it 'all uppercase chars special leader && two digits wildcard right (valid)' do
          expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a=$b}', trace: true)
        end
        it 'all uppercase chars special leader && one digit two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a!=$b}', trace: true)
        end
        it 'all uppercase chars special leader && all digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a~\\Poe}', trace: true)
        end
        it 'all uppercase chars special leader && all uppercase chars special leader (valid)' do
          expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a!~\\Poe}', trace: true)
        end
        it 'all uppercase chars special leader && two wildcards left one uppercase char (valid)' do
          expect(parser.marc_spec).to parse('...{$a!~\\Poe}{/#=\\/}', trace: true)
        end
        it 'all uppercase chars special leader && one wildcard left two uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a|$b}{$c}', trace: true)
        end
        it 'all uppercase chars special leader && one wildcard between uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a}{$b|$c}', trace: true)
        end
        it 'all uppercase chars special leader && one uppercase char two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a|$b}{$c|$d}', trace: true)
        end
        it 'all uppercase chars special leader && mix one lowercase char and two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a|$b|$c}', trace: true)
        end
        it 'all uppercase chars special leader && mix two lowercase chars and one digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a~\\test\\$}', trace: true)
        end
        it 'all uppercase chars special leader && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a~\\test\\{}', trace: true)
        end
        it 'all uppercase chars special leader && two wildcards and one lowercase char right (valid)' do
          expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a~\\test\\}}', trace: true)
        end
        it 'all uppercase chars special leader && one wildcard left and two lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a~\\test\\!}', trace: true)
        end
        it 'all uppercase chars special leader && one lowercase and two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a~\\test\\=}', trace: true)
        end
        it 'all uppercase chars special leader && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a~\\test\\~}', trace: true)
        end
        it 'all uppercase chars special leader && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a~\\test\\?}', trace: true)
        end
        it 'all uppercase chars special leader && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a!~\\Poe}{$a~\\test\\|}', trace: true)
        end
        it 'two wildcards left one uppercase char && all wildcards (valid)' do
          expect(parser.marc_spec).to parse('...{/#=\\/}{245$a}', trace: true)
        end
        it 'two wildcards left one uppercase char && two wildcards left with digit (valid)' do
          expect(parser.marc_spec).to parse('...{/#=\\/}{$a}', trace: true)
        end
        it 'two wildcards left one uppercase char && one wildcard left with two digits (valid)' do
          expect(parser.marc_spec).to parse('...{/#=\\/}{?$a}', trace: true)
        end
        it 'two wildcards left one uppercase char && wildcard between digits (valid)' do
          expect(parser.marc_spec).to parse('...{/#=\\/}{!$a}', trace: true)
        end
        it 'two wildcards left one uppercase char && two digits wildcard right (valid)' do
          expect(parser.marc_spec).to parse('...{/#=\\/}{$a=$b}', trace: true)
        end
        it 'two wildcards left one uppercase char && one digit two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{/#=\\/}{$a!=$b}', trace: true)
        end
        it 'two wildcards left one uppercase char && all digits (valid)' do
          expect(parser.marc_spec).to parse('...{/#=\\/}{$a~\\Poe}', trace: true)
        end
        it 'two wildcards left one uppercase char && all uppercase chars special leader (valid)' do
          expect(parser.marc_spec).to parse('...{/#=\\/}{$a!~\\Poe}', trace: true)
        end
        it 'two wildcards left one uppercase char && two wildcards left one uppercase char (valid)' do
          expect(parser.marc_spec).to parse('...{/#=\\/}{/#=\\/}', trace: true)
        end
        it 'two wildcards left one uppercase char && one wildcard left two uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{/#=\\/}{$a|$b}{$c}', trace: true)
        end
        it 'two wildcards left one uppercase char && one wildcard between uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{/#=\\/}{$a}{$b|$c}', trace: true)
        end
        it 'two wildcards left one uppercase char && one uppercase char two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{/#=\\/}{$a|$b}{$c|$d}', trace: true)
        end
        it 'two wildcards left one uppercase char && mix one lowercase char and two digits (valid)' do
          expect(parser.marc_spec).to parse('...{/#=\\/}{$a|$b|$c}', trace: true)
        end
        it 'two wildcards left one uppercase char && mix two lowercase chars and one digit (valid)' do
          expect(parser.marc_spec).to parse('...{/#=\\/}{$a~\\test\\$}', trace: true)
        end
        it 'two wildcards left one uppercase char && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{/#=\\/}{$a~\\test\\{}', trace: true)
        end
        it 'two wildcards left one uppercase char && two wildcards and one lowercase char right (valid)' do
          expect(parser.marc_spec).to parse('...{/#=\\/}{$a~\\test\\}}', trace: true)
        end
        it 'two wildcards left one uppercase char && one wildcard left and two lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{/#=\\/}{$a~\\test\\!}', trace: true)
        end
        it 'two wildcards left one uppercase char && one lowercase and two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{/#=\\/}{$a~\\test\\=}', trace: true)
        end
        it 'two wildcards left one uppercase char && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{/#=\\/}{$a~\\test\\~}', trace: true)
        end
        it 'two wildcards left one uppercase char && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{/#=\\/}{$a~\\test\\?}', trace: true)
        end
        it 'two wildcards left one uppercase char && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{/#=\\/}{$a~\\test\\|}', trace: true)
        end
        it 'one wildcard left two uppercase chars && all wildcards (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c}{245$a}', trace: true)
        end
        it 'one wildcard left two uppercase chars && two wildcards left with digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a}', trace: true)
        end
        it 'one wildcard left two uppercase chars && one wildcard left with two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c}{?$a}', trace: true)
        end
        it 'one wildcard left two uppercase chars && wildcard between digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c}{!$a}', trace: true)
        end
        it 'one wildcard left two uppercase chars && two digits wildcard right (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a=$b}', trace: true)
        end
        it 'one wildcard left two uppercase chars && one digit two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a!=$b}', trace: true)
        end
        it 'one wildcard left two uppercase chars && all digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a~\\Poe}', trace: true)
        end
        it 'one wildcard left two uppercase chars && all uppercase chars special leader (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a!~\\Poe}', trace: true)
        end
        it 'one wildcard left two uppercase chars && two wildcards left one uppercase char (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c}{/#=\\/}', trace: true)
        end
        it 'one wildcard left two uppercase chars && one wildcard left two uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a|$b}{$c}', trace: true)
        end
        it 'one wildcard left two uppercase chars && one wildcard between uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a}{$b|$c}', trace: true)
        end
        it 'one wildcard left two uppercase chars && one uppercase char two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a|$b}{$c|$d}', trace: true)
        end
        it 'one wildcard left two uppercase chars && mix one lowercase char and two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a|$b|$c}', trace: true)
        end
        it 'one wildcard left two uppercase chars && mix two lowercase chars and one digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a~\\test\\$}', trace: true)
        end
        it 'one wildcard left two uppercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a~\\test\\{}', trace: true)
        end
        it 'one wildcard left two uppercase chars && two wildcards and one lowercase char right (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a~\\test\\}}', trace: true)
        end
        it 'one wildcard left two uppercase chars && one wildcard left and two lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a~\\test\\!}', trace: true)
        end
        it 'one wildcard left two uppercase chars && one lowercase and two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a~\\test\\=}', trace: true)
        end
        it 'one wildcard left two uppercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a~\\test\\~}', trace: true)
        end
        it 'one wildcard left two uppercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a~\\test\\?}', trace: true)
        end
        it 'one wildcard left two uppercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c}{$a~\\test\\|}', trace: true)
        end
        it 'one wildcard between uppercase chars && all wildcards (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$b|$c}{245$a}', trace: true)
        end
        it 'one wildcard between uppercase chars && two wildcards left with digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a}', trace: true)
        end
        it 'one wildcard between uppercase chars && one wildcard left with two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$b|$c}{?$a}', trace: true)
        end
        it 'one wildcard between uppercase chars && wildcard between digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$b|$c}{!$a}', trace: true)
        end
        it 'one wildcard between uppercase chars && two digits wildcard right (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a=$b}', trace: true)
        end
        it 'one wildcard between uppercase chars && one digit two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a!=$b}', trace: true)
        end
        it 'one wildcard between uppercase chars && all digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a~\\Poe}', trace: true)
        end
        it 'one wildcard between uppercase chars && all uppercase chars special leader (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a!~\\Poe}', trace: true)
        end
        it 'one wildcard between uppercase chars && two wildcards left one uppercase char (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$b|$c}{/#=\\/}', trace: true)
        end
        it 'one wildcard between uppercase chars && one wildcard left two uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a|$b}{$c}', trace: true)
        end
        it 'one wildcard between uppercase chars && one wildcard between uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a}{$b|$c}', trace: true)
        end
        it 'one wildcard between uppercase chars && one uppercase char two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a|$b}{$c|$d}', trace: true)
        end
        it 'one wildcard between uppercase chars && mix one lowercase char and two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a|$b|$c}', trace: true)
        end
        it 'one wildcard between uppercase chars && mix two lowercase chars and one digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a~\\test\\$}', trace: true)
        end
        it 'one wildcard between uppercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a~\\test\\{}', trace: true)
        end
        it 'one wildcard between uppercase chars && two wildcards and one lowercase char right (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a~\\test\\}}', trace: true)
        end
        it 'one wildcard between uppercase chars && one wildcard left and two lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a~\\test\\!}', trace: true)
        end
        it 'one wildcard between uppercase chars && one lowercase and two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a~\\test\\=}', trace: true)
        end
        it 'one wildcard between uppercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a~\\test\\~}', trace: true)
        end
        it 'one wildcard between uppercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a~\\test\\?}', trace: true)
        end
        it 'one wildcard between uppercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$b|$c}{$a~\\test\\|}', trace: true)
        end
        it 'one uppercase char two wildcards right && all wildcards (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{245$a}', trace: true)
        end
        it 'one uppercase char two wildcards right && two wildcards left with digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a}', trace: true)
        end
        it 'one uppercase char two wildcards right && one wildcard left with two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{?$a}', trace: true)
        end
        it 'one uppercase char two wildcards right && wildcard between digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{!$a}', trace: true)
        end
        it 'one uppercase char two wildcards right && two digits wildcard right (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a=$b}', trace: true)
        end
        it 'one uppercase char two wildcards right && one digit two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a!=$b}', trace: true)
        end
        it 'one uppercase char two wildcards right && all digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a~\\Poe}', trace: true)
        end
        it 'one uppercase char two wildcards right && all uppercase chars special leader (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a!~\\Poe}', trace: true)
        end
        it 'one uppercase char two wildcards right && two wildcards left one uppercase char (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{/#=\\/}', trace: true)
        end
        it 'one uppercase char two wildcards right && one wildcard left two uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a|$b}{$c}', trace: true)
        end
        it 'one uppercase char two wildcards right && one wildcard between uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a}{$b|$c}', trace: true)
        end
        it 'one uppercase char two wildcards right && one uppercase char two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a|$b}{$c|$d}', trace: true)
        end
        it 'one uppercase char two wildcards right && mix one lowercase char and two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a|$b|$c}', trace: true)
        end
        it 'one uppercase char two wildcards right && mix two lowercase chars and one digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a~\\test\\$}', trace: true)
        end
        it 'one uppercase char two wildcards right && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a~\\test\\{}', trace: true)
        end
        it 'one uppercase char two wildcards right && two wildcards and one lowercase char right (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a~\\test\\}}', trace: true)
        end
        it 'one uppercase char two wildcards right && one wildcard left and two lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a~\\test\\!}', trace: true)
        end
        it 'one uppercase char two wildcards right && one lowercase and two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a~\\test\\=}', trace: true)
        end
        it 'one uppercase char two wildcards right && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a~\\test\\~}', trace: true)
        end
        it 'one uppercase char two wildcards right && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a~\\test\\?}', trace: true)
        end
        it 'one uppercase char two wildcards right && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}{$a~\\test\\|}', trace: true)
        end
        it 'mix one lowercase char and two digits && all wildcards (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b|$c}{245$a}', trace: true)
        end
        it 'mix one lowercase char and two digits && two wildcards left with digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a}', trace: true)
        end
        it 'mix one lowercase char and two digits && one wildcard left with two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b|$c}{?$a}', trace: true)
        end
        it 'mix one lowercase char and two digits && wildcard between digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b|$c}{!$a}', trace: true)
        end
        it 'mix one lowercase char and two digits && two digits wildcard right (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a=$b}', trace: true)
        end
        it 'mix one lowercase char and two digits && one digit two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a!=$b}', trace: true)
        end
        it 'mix one lowercase char and two digits && all digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a~\\Poe}', trace: true)
        end
        it 'mix one lowercase char and two digits && all uppercase chars special leader (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a!~\\Poe}', trace: true)
        end
        it 'mix one lowercase char and two digits && two wildcards left one uppercase char (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b|$c}{/#=\\/}', trace: true)
        end
        it 'mix one lowercase char and two digits && one wildcard left two uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a|$b}{$c}', trace: true)
        end
        it 'mix one lowercase char and two digits && one wildcard between uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a}{$b|$c}', trace: true)
        end
        it 'mix one lowercase char and two digits && one uppercase char two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a|$b}{$c|$d}', trace: true)
        end
        it 'mix one lowercase char and two digits && mix one lowercase char and two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a|$b|$c}', trace: true)
        end
        it 'mix one lowercase char and two digits && mix two lowercase chars and one digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a~\\test\\$}', trace: true)
        end
        it 'mix one lowercase char and two digits && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a~\\test\\{}', trace: true)
        end
        it 'mix one lowercase char and two digits && two wildcards and one lowercase char right (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a~\\test\\}}', trace: true)
        end
        it 'mix one lowercase char and two digits && one wildcard left and two lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a~\\test\\!}', trace: true)
        end
        it 'mix one lowercase char and two digits && one lowercase and two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a~\\test\\=}', trace: true)
        end
        it 'mix one lowercase char and two digits && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a~\\test\\~}', trace: true)
        end
        it 'mix one lowercase char and two digits && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a~\\test\\?}', trace: true)
        end
        it 'mix one lowercase char and two digits && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b|$c}{$a~\\test\\|}', trace: true)
        end
        it 'mix two lowercase chars and one digit && all wildcards (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\$}{245$a}', trace: true)
        end
        it 'mix two lowercase chars and one digit && two wildcards left with digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a}', trace: true)
        end
        it 'mix two lowercase chars and one digit && one wildcard left with two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\$}{?$a}', trace: true)
        end
        it 'mix two lowercase chars and one digit && wildcard between digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\$}{!$a}', trace: true)
        end
        it 'mix two lowercase chars and one digit && two digits wildcard right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a=$b}', trace: true)
        end
        it 'mix two lowercase chars and one digit && one digit two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a!=$b}', trace: true)
        end
        it 'mix two lowercase chars and one digit && all digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a~\\Poe}', trace: true)
        end
        it 'mix two lowercase chars and one digit && all uppercase chars special leader (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a!~\\Poe}', trace: true)
        end
        it 'mix two lowercase chars and one digit && two wildcards left one uppercase char (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\$}{/#=\\/}', trace: true)
        end
        it 'mix two lowercase chars and one digit && one wildcard left two uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a|$b}{$c}', trace: true)
        end
        it 'mix two lowercase chars and one digit && one wildcard between uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a}{$b|$c}', trace: true)
        end
        it 'mix two lowercase chars and one digit && one uppercase char two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a|$b}{$c|$d}', trace: true)
        end
        it 'mix two lowercase chars and one digit && mix one lowercase char and two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a|$b|$c}', trace: true)
        end
        it 'mix two lowercase chars and one digit && mix two lowercase chars and one digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a~\\test\\$}', trace: true)
        end
        it 'mix two lowercase chars and one digit && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a~\\test\\{}', trace: true)
        end
        it 'mix two lowercase chars and one digit && two wildcards and one lowercase char right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a~\\test\\}}', trace: true)
        end
        it 'mix two lowercase chars and one digit && one wildcard left and two lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a~\\test\\!}', trace: true)
        end
        it 'mix two lowercase chars and one digit && one lowercase and two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a~\\test\\=}', trace: true)
        end
        it 'mix two lowercase chars and one digit && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a~\\test\\~}', trace: true)
        end
        it 'mix two lowercase chars and one digit && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a~\\test\\?}', trace: true)
        end
        it 'mix two lowercase chars and one digit && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\$}{$a~\\test\\|}', trace: true)
        end
        it 'all lowercase chars && all wildcards (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\{}{245$a}', trace: true)
        end
        it 'all lowercase chars && two wildcards left with digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a}', trace: true)
        end
        it 'all lowercase chars && one wildcard left with two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\{}{?$a}', trace: true)
        end
        it 'all lowercase chars && wildcard between digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\{}{!$a}', trace: true)
        end
        it 'all lowercase chars && two digits wildcard right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a=$b}', trace: true)
        end
        it 'all lowercase chars && one digit two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a!=$b}', trace: true)
        end
        it 'all lowercase chars && all digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a~\\Poe}', trace: true)
        end
        it 'all lowercase chars && all uppercase chars special leader (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a!~\\Poe}', trace: true)
        end
        it 'all lowercase chars && two wildcards left one uppercase char (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\{}{/#=\\/}', trace: true)
        end
        it 'all lowercase chars && one wildcard left two uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a|$b}{$c}', trace: true)
        end
        it 'all lowercase chars && one wildcard between uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a}{$b|$c}', trace: true)
        end
        it 'all lowercase chars && one uppercase char two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a|$b}{$c|$d}', trace: true)
        end
        it 'all lowercase chars && mix one lowercase char and two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a|$b|$c}', trace: true)
        end
        it 'all lowercase chars && mix two lowercase chars and one digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a~\\test\\$}', trace: true)
        end
        it 'all lowercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a~\\test\\{}', trace: true)
        end
        it 'all lowercase chars && two wildcards and one lowercase char right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a~\\test\\}}', trace: true)
        end
        it 'all lowercase chars && one wildcard left and two lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a~\\test\\!}', trace: true)
        end
        it 'all lowercase chars && one lowercase and two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a~\\test\\=}', trace: true)
        end
        it 'all lowercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a~\\test\\~}', trace: true)
        end
        it 'all lowercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a~\\test\\?}', trace: true)
        end
        it 'all lowercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\{}{$a~\\test\\|}', trace: true)
        end
        it 'two wildcards and one lowercase char right && all wildcards (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\}}{245$a}', trace: true)
        end
        it 'two wildcards and one lowercase char right && two wildcards left with digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a}', trace: true)
        end
        it 'two wildcards and one lowercase char right && one wildcard left with two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\}}{?$a}', trace: true)
        end
        it 'two wildcards and one lowercase char right && wildcard between digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\}}{!$a}', trace: true)
        end
        it 'two wildcards and one lowercase char right && two digits wildcard right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a=$b}', trace: true)
        end
        it 'two wildcards and one lowercase char right && one digit two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a!=$b}', trace: true)
        end
        it 'two wildcards and one lowercase char right && all digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a~\\Poe}', trace: true)
        end
        it 'two wildcards and one lowercase char right && all uppercase chars special leader (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a!~\\Poe}', trace: true)
        end
        it 'two wildcards and one lowercase char right && two wildcards left one uppercase char (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\}}{/#=\\/}', trace: true)
        end
        it 'two wildcards and one lowercase char right && one wildcard left two uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a|$b}{$c}', trace: true)
        end
        it 'two wildcards and one lowercase char right && one wildcard between uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a}{$b|$c}', trace: true)
        end
        it 'two wildcards and one lowercase char right && one uppercase char two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a|$b}{$c|$d}', trace: true)
        end
        it 'two wildcards and one lowercase char right && mix one lowercase char and two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a|$b|$c}', trace: true)
        end
        it 'two wildcards and one lowercase char right && mix two lowercase chars and one digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a~\\test\\$}', trace: true)
        end
        it 'two wildcards and one lowercase char right && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a~\\test\\{}', trace: true)
        end
        it 'two wildcards and one lowercase char right && two wildcards and one lowercase char right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a~\\test\\}}', trace: true)
        end
        it 'two wildcards and one lowercase char right && one wildcard left and two lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a~\\test\\!}', trace: true)
        end
        it 'two wildcards and one lowercase char right && one lowercase and two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a~\\test\\=}', trace: true)
        end
        it 'two wildcards and one lowercase char right && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a~\\test\\~}', trace: true)
        end
        it 'two wildcards and one lowercase char right && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a~\\test\\?}', trace: true)
        end
        it 'two wildcards and one lowercase char right && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\}}{$a~\\test\\|}', trace: true)
        end
        it 'one wildcard left and two lowercase chars && all wildcards (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\!}{245$a}', trace: true)
        end
        it 'one wildcard left and two lowercase chars && two wildcards left with digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a}', trace: true)
        end
        it 'one wildcard left and two lowercase chars && one wildcard left with two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\!}{?$a}', trace: true)
        end
        it 'one wildcard left and two lowercase chars && wildcard between digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\!}{!$a}', trace: true)
        end
        it 'one wildcard left and two lowercase chars && two digits wildcard right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a=$b}', trace: true)
        end
        it 'one wildcard left and two lowercase chars && one digit two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a!=$b}', trace: true)
        end
        it 'one wildcard left and two lowercase chars && all digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a~\\Poe}', trace: true)
        end
        it 'one wildcard left and two lowercase chars && all uppercase chars special leader (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a!~\\Poe}', trace: true)
        end
        it 'one wildcard left and two lowercase chars && two wildcards left one uppercase char (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\!}{/#=\\/}', trace: true)
        end
        it 'one wildcard left and two lowercase chars && one wildcard left two uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a|$b}{$c}', trace: true)
        end
        it 'one wildcard left and two lowercase chars && one wildcard between uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a}{$b|$c}', trace: true)
        end
        it 'one wildcard left and two lowercase chars && one uppercase char two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a|$b}{$c|$d}', trace: true)
        end
        it 'one wildcard left and two lowercase chars && mix one lowercase char and two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a|$b|$c}', trace: true)
        end
        it 'one wildcard left and two lowercase chars && mix two lowercase chars and one digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a~\\test\\$}', trace: true)
        end
        it 'one wildcard left and two lowercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a~\\test\\{}', trace: true)
        end
        it 'one wildcard left and two lowercase chars && two wildcards and one lowercase char right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a~\\test\\}}', trace: true)
        end
        it 'one wildcard left and two lowercase chars && one wildcard left and two lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a~\\test\\!}', trace: true)
        end
        it 'one wildcard left and two lowercase chars && one lowercase and two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a~\\test\\=}', trace: true)
        end
        it 'one wildcard left and two lowercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a~\\test\\~}', trace: true)
        end
        it 'one wildcard left and two lowercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a~\\test\\?}', trace: true)
        end
        it 'one wildcard left and two lowercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\!}{$a~\\test\\|}', trace: true)
        end
        it 'one lowercase and two wildcards right && all wildcards (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\=}{245$a}', trace: true)
        end
        it 'one lowercase and two wildcards right && two wildcards left with digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a}', trace: true)
        end
        it 'one lowercase and two wildcards right && one wildcard left with two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\=}{?$a}', trace: true)
        end
        it 'one lowercase and two wildcards right && wildcard between digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\=}{!$a}', trace: true)
        end
        it 'one lowercase and two wildcards right && two digits wildcard right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a=$b}', trace: true)
        end
        it 'one lowercase and two wildcards right && one digit two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a!=$b}', trace: true)
        end
        it 'one lowercase and two wildcards right && all digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a~\\Poe}', trace: true)
        end
        it 'one lowercase and two wildcards right && all uppercase chars special leader (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a!~\\Poe}', trace: true)
        end
        it 'one lowercase and two wildcards right && two wildcards left one uppercase char (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\=}{/#=\\/}', trace: true)
        end
        it 'one lowercase and two wildcards right && one wildcard left two uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a|$b}{$c}', trace: true)
        end
        it 'one lowercase and two wildcards right && one wildcard between uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a}{$b|$c}', trace: true)
        end
        it 'one lowercase and two wildcards right && one uppercase char two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a|$b}{$c|$d}', trace: true)
        end
        it 'one lowercase and two wildcards right && mix one lowercase char and two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a|$b|$c}', trace: true)
        end
        it 'one lowercase and two wildcards right && mix two lowercase chars and one digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a~\\test\\$}', trace: true)
        end
        it 'one lowercase and two wildcards right && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a~\\test\\{}', trace: true)
        end
        it 'one lowercase and two wildcards right && two wildcards and one lowercase char right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a~\\test\\}}', trace: true)
        end
        it 'one lowercase and two wildcards right && one wildcard left and two lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a~\\test\\!}', trace: true)
        end
        it 'one lowercase and two wildcards right && one lowercase and two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a~\\test\\=}', trace: true)
        end
        it 'one lowercase and two wildcards right && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a~\\test\\~}', trace: true)
        end
        it 'one lowercase and two wildcards right && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a~\\test\\?}', trace: true)
        end
        it 'one lowercase and two wildcards right && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\=}{$a~\\test\\|}', trace: true)
        end
        it 'all lowercase chars && all wildcards (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\~}{245$a}', trace: true)
        end
        it 'all lowercase chars && two wildcards left with digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a}', trace: true)
        end
        it 'all lowercase chars && one wildcard left with two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\~}{?$a}', trace: true)
        end
        it 'all lowercase chars && wildcard between digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\~}{!$a}', trace: true)
        end
        it 'all lowercase chars && two digits wildcard right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a=$b}', trace: true)
        end
        it 'all lowercase chars && one digit two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a!=$b}', trace: true)
        end
        it 'all lowercase chars && all digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a~\\Poe}', trace: true)
        end
        it 'all lowercase chars && all uppercase chars special leader (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a!~\\Poe}', trace: true)
        end
        it 'all lowercase chars && two wildcards left one uppercase char (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\~}{/#=\\/}', trace: true)
        end
        it 'all lowercase chars && one wildcard left two uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a|$b}{$c}', trace: true)
        end
        it 'all lowercase chars && one wildcard between uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a}{$b|$c}', trace: true)
        end
        it 'all lowercase chars && one uppercase char two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a|$b}{$c|$d}', trace: true)
        end
        it 'all lowercase chars && mix one lowercase char and two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a|$b|$c}', trace: true)
        end
        it 'all lowercase chars && mix two lowercase chars and one digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a~\\test\\$}', trace: true)
        end
        it 'all lowercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a~\\test\\{}', trace: true)
        end
        it 'all lowercase chars && two wildcards and one lowercase char right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a~\\test\\}}', trace: true)
        end
        it 'all lowercase chars && one wildcard left and two lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a~\\test\\!}', trace: true)
        end
        it 'all lowercase chars && one lowercase and two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a~\\test\\=}', trace: true)
        end
        it 'all lowercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a~\\test\\~}', trace: true)
        end
        it 'all lowercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a~\\test\\?}', trace: true)
        end
        it 'all lowercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\~}{$a~\\test\\|}', trace: true)
        end
        it 'all lowercase chars && all wildcards (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\?}{245$a}', trace: true)
        end
        it 'all lowercase chars && two wildcards left with digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a}', trace: true)
        end
        it 'all lowercase chars && one wildcard left with two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\?}{?$a}', trace: true)
        end
        it 'all lowercase chars && wildcard between digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\?}{!$a}', trace: true)
        end
        it 'all lowercase chars && two digits wildcard right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a=$b}', trace: true)
        end
        it 'all lowercase chars && one digit two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a!=$b}', trace: true)
        end
        it 'all lowercase chars && all digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a~\\Poe}', trace: true)
        end
        it 'all lowercase chars && all uppercase chars special leader (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a!~\\Poe}', trace: true)
        end
        it 'all lowercase chars && two wildcards left one uppercase char (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\?}{/#=\\/}', trace: true)
        end
        it 'all lowercase chars && one wildcard left two uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a|$b}{$c}', trace: true)
        end
        it 'all lowercase chars && one wildcard between uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a}{$b|$c}', trace: true)
        end
        it 'all lowercase chars && one uppercase char two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a|$b}{$c|$d}', trace: true)
        end
        it 'all lowercase chars && mix one lowercase char and two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a|$b|$c}', trace: true)
        end
        it 'all lowercase chars && mix two lowercase chars and one digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a~\\test\\$}', trace: true)
        end
        it 'all lowercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a~\\test\\{}', trace: true)
        end
        it 'all lowercase chars && two wildcards and one lowercase char right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a~\\test\\}}', trace: true)
        end
        it 'all lowercase chars && one wildcard left and two lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a~\\test\\!}', trace: true)
        end
        it 'all lowercase chars && one lowercase and two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a~\\test\\=}', trace: true)
        end
        it 'all lowercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a~\\test\\~}', trace: true)
        end
        it 'all lowercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a~\\test\\?}', trace: true)
        end
        it 'all lowercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\?}{$a~\\test\\|}', trace: true)
        end
        it 'all lowercase chars && all wildcards (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\|}{245$a}', trace: true)
        end
        it 'all lowercase chars && two wildcards left with digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a}', trace: true)
        end
        it 'all lowercase chars && one wildcard left with two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\|}{?$a}', trace: true)
        end
        it 'all lowercase chars && wildcard between digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\|}{!$a}', trace: true)
        end
        it 'all lowercase chars && two digits wildcard right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a=$b}', trace: true)
        end
        it 'all lowercase chars && one digit two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a!=$b}', trace: true)
        end
        it 'all lowercase chars && all digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a~\\Poe}', trace: true)
        end
        it 'all lowercase chars && all uppercase chars special leader (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a!~\\Poe}', trace: true)
        end
        it 'all lowercase chars && two wildcards left one uppercase char (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\|}{/#=\\/}', trace: true)
        end
        it 'all lowercase chars && one wildcard left two uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a|$b}{$c}', trace: true)
        end
        it 'all lowercase chars && one wildcard between uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a}{$b|$c}', trace: true)
        end
        it 'all lowercase chars && one uppercase char two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a|$b}{$c|$d}', trace: true)
        end
        it 'all lowercase chars && mix one lowercase char and two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a|$b|$c}', trace: true)
        end
        it 'all lowercase chars && mix two lowercase chars and one digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a~\\test\\$}', trace: true)
        end
        it 'all lowercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a~\\test\\{}', trace: true)
        end
        it 'all lowercase chars && two wildcards and one lowercase char right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a~\\test\\}}', trace: true)
        end
        it 'all lowercase chars && one wildcard left and two lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a~\\test\\!}', trace: true)
        end
        it 'all lowercase chars && one lowercase and two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a~\\test\\=}', trace: true)
        end
        it 'all lowercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a~\\test\\~}', trace: true)
        end
        it 'all lowercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a~\\test\\?}', trace: true)
        end
        it 'all lowercase chars && all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\|}{$a~\\test\\|}', trace: true)
        end
      end
    end
  end
end
