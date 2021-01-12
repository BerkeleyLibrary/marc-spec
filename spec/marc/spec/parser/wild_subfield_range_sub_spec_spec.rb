require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve, RubyParenthesesAfterMethodCallInspection
module MARC
  module Spec
    describe :wild_subfield_range_sub_spec do
      let(:parser) { Parser.new }

      describe 'wild combination of valid field tag, subfield range and subspec' do
        it 'subfield range with lowercase subfieldtags && all wildcards' do
          expect(parser.marc_spec).to parse('...$a-z{245$a}', trace: true)
        end
        it 'subfield range with lowercase subfieldtags && two wildcards left with digit' do
          expect(parser.marc_spec).to parse('...$a-z{$a}', trace: true)
        end
        it 'subfield range with lowercase subfieldtags && one wildcard left with two digits' do
          expect(parser.marc_spec).to parse('...$a-z{?$a}', trace: true)
        end
        it 'subfield range with lowercase subfieldtags && wildcard between digits' do
          expect(parser.marc_spec).to parse('...$a-z{!$a}', trace: true)
        end
        it 'subfield range with lowercase subfieldtags && two digits wildcard right' do
          expect(parser.marc_spec).to parse('...$a-z{$a=$b}', trace: true)
        end
        it 'subfield range with lowercase subfieldtags && one digit two wildcards right' do
          expect(parser.marc_spec).to parse('...$a-z{$a!=$b}', trace: true)
        end
        it 'subfield range with lowercase subfieldtags && all digits' do
          expect(parser.marc_spec).to parse('...$a-z{$a~\\Poe}', trace: true)
        end
        it 'subfield range with lowercase subfieldtags && all uppercase chars special leader' do
          expect(parser.marc_spec).to parse('...$a-z{$a!~\\Poe}', trace: true)
        end
        it 'subfield range with lowercase subfieldtags && two wildcards left one uppercase char' do
          expect(parser.marc_spec).to parse('...$a-z{/#=\\/}', trace: true)
        end
        it 'subfield range with lowercase subfieldtags && one wildcard left two uppercase chars' do
          expect(parser.marc_spec).to parse('...$a-z{$a|$b}{$c}', trace: true)
        end
        it 'subfield range with lowercase subfieldtags && one wildcard between uppercase chars' do
          expect(parser.marc_spec).to parse('...$a-z{$a}{$b|$c}', trace: true)
        end
        it 'subfield range with lowercase subfieldtags && one uppercase char two wildcards right' do
          expect(parser.marc_spec).to parse('...$a-z{$a|$b}{$c|$d}', trace: true)
        end
        it 'subfield range with lowercase subfieldtags && mix one lowercase char and two digits' do
          expect(parser.marc_spec).to parse('...$a-z{$a|$b|$c}', trace: true)
        end
        it 'subfield range with lowercase subfieldtags && mix two lowercase chars and one digit' do
          expect(parser.marc_spec).to parse('...$a-z{$a~\\test\\$}', trace: true)
        end
        it 'subfield range with lowercase subfieldtags && all lowercase chars' do
          expect(parser.marc_spec).to parse('...$a-z{$a~\\test\\{}', trace: true)
        end
        it 'subfield range with lowercase subfieldtags && two wildcards and one lowercase char right' do
          expect(parser.marc_spec).to parse('...$a-z{$a~\\test\\}}', trace: true)
        end
        it 'subfield range with lowercase subfieldtags && one wildcard left and two lowercase chars' do
          expect(parser.marc_spec).to parse('...$a-z{$a~\\test\\!}', trace: true)
        end
        it 'subfield range with lowercase subfieldtags && one lowercase and two wildcards right' do
          expect(parser.marc_spec).to parse('...$a-z{$a~\\test\\=}', trace: true)
        end
        it 'subfield range with lowercase subfieldtags && all lowercase chars' do
          expect(parser.marc_spec).to parse('...$a-z{$a~\\test\\~}', trace: true)
        end
        it 'subfield range with lowercase subfieldtags && all lowercase chars' do
          expect(parser.marc_spec).to parse('...$a-z{$a~\\test\\?}', trace: true)
        end
        it 'subfield range with lowercase subfieldtags && all lowercase chars' do
          expect(parser.marc_spec).to parse('...$a-z{$a~\\test\\|}', trace: true)
        end
        it 'subfield range with digits && all wildcards' do
          expect(parser.marc_spec).to parse('...$0-9{245$a}', trace: true)
        end
        it 'subfield range with digits && two wildcards left with digit' do
          expect(parser.marc_spec).to parse('...$0-9{$a}', trace: true)
        end
        it 'subfield range with digits && one wildcard left with two digits' do
          expect(parser.marc_spec).to parse('...$0-9{?$a}', trace: true)
        end
        it 'subfield range with digits && wildcard between digits' do
          expect(parser.marc_spec).to parse('...$0-9{!$a}', trace: true)
        end
        it 'subfield range with digits && two digits wildcard right' do
          expect(parser.marc_spec).to parse('...$0-9{$a=$b}', trace: true)
        end
        it 'subfield range with digits && one digit two wildcards right' do
          expect(parser.marc_spec).to parse('...$0-9{$a!=$b}', trace: true)
        end
        it 'subfield range with digits && all digits' do
          expect(parser.marc_spec).to parse('...$0-9{$a~\\Poe}', trace: true)
        end
        it 'subfield range with digits && all uppercase chars special leader' do
          expect(parser.marc_spec).to parse('...$0-9{$a!~\\Poe}', trace: true)
        end
        it 'subfield range with digits && two wildcards left one uppercase char' do
          expect(parser.marc_spec).to parse('...$0-9{/#=\\/}', trace: true)
        end
        it 'subfield range with digits && one wildcard left two uppercase chars' do
          expect(parser.marc_spec).to parse('...$0-9{$a|$b}{$c}', trace: true)
        end
        it 'subfield range with digits && one wildcard between uppercase chars' do
          expect(parser.marc_spec).to parse('...$0-9{$a}{$b|$c}', trace: true)
        end
        it 'subfield range with digits && one uppercase char two wildcards right' do
          expect(parser.marc_spec).to parse('...$0-9{$a|$b}{$c|$d}', trace: true)
        end
        it 'subfield range with digits && mix one lowercase char and two digits' do
          expect(parser.marc_spec).to parse('...$0-9{$a|$b|$c}', trace: true)
        end
        it 'subfield range with digits && mix two lowercase chars and one digit' do
          expect(parser.marc_spec).to parse('...$0-9{$a~\\test\\$}', trace: true)
        end
        it 'subfield range with digits && all lowercase chars' do
          expect(parser.marc_spec).to parse('...$0-9{$a~\\test\\{}', trace: true)
        end
        it 'subfield range with digits && two wildcards and one lowercase char right' do
          expect(parser.marc_spec).to parse('...$0-9{$a~\\test\\}}', trace: true)
        end
        it 'subfield range with digits && one wildcard left and two lowercase chars' do
          expect(parser.marc_spec).to parse('...$0-9{$a~\\test\\!}', trace: true)
        end
        it 'subfield range with digits && one lowercase and two wildcards right' do
          expect(parser.marc_spec).to parse('...$0-9{$a~\\test\\=}', trace: true)
        end
        it 'subfield range with digits && all lowercase chars' do
          expect(parser.marc_spec).to parse('...$0-9{$a~\\test\\~}', trace: true)
        end
        it 'subfield range with digits && all lowercase chars' do
          expect(parser.marc_spec).to parse('...$0-9{$a~\\test\\?}', trace: true)
        end
        it 'subfield range with digits && all lowercase chars' do
          expect(parser.marc_spec).to parse('...$0-9{$a~\\test\\|}', trace: true)
        end
      end
    end
  end
end
