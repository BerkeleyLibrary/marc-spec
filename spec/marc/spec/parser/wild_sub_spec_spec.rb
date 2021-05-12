require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve, RubyParenthesesAfterMethodCallInspection
module MARC
  module Spec
    describe :wild_sub_spec do
      let(:parser) { Parser.new }

      describe 'wild combination of valid field tag and subspec (valid)' do
        it 'all wildcards (valid)' do
          expect(parser.marc_spec).to parse('...{245$a}', trace: true)
        end
        it 'two wildcards left with digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a}', trace: true)
        end
        it 'one wildcard left with two digits (valid)' do
          expect(parser.marc_spec).to parse('...{?$a}', trace: true)
        end
        it 'wildcard between digits (valid)' do
          expect(parser.marc_spec).to parse('...{!$a}', trace: true)
        end
        it 'two digits wildcard right (valid)' do
          expect(parser.marc_spec).to parse('...{$a=$b}', trace: true)
        end
        it 'one digit two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a!=$b}', trace: true)
        end
        it 'all digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\Poe}', trace: true)
        end
        it 'all uppercase chars special leader (valid)' do
          expect(parser.marc_spec).to parse('...{$a!~\\Poe}', trace: true)
        end
        it 'two wildcards left one uppercase char (valid)' do
          expect(parser.marc_spec).to parse('...{/#=\\/}', trace: true)
        end
        it 'one wildcard left two uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c}', trace: true)
        end
        it 'one wildcard between uppercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a}{$b|$c}', trace: true)
        end
        it 'one uppercase char two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}', trace: true)
        end
        it 'mix one lowercase char and two digits (valid)' do
          expect(parser.marc_spec).to parse('...{$a|$b|$c}', trace: true)
        end
        it 'mix two lowercase chars and one digit (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\$}', trace: true)
        end
        it 'all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\{}', trace: true)
        end
        it 'two wildcards and one lowercase char right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\}}', trace: true)
        end
        it 'one wildcard left and two lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\!}', trace: true)
        end
        it 'one lowercase and two wildcards right (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\=}', trace: true)
        end
        it 'all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\~}', trace: true)
        end
        it 'all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\?}', trace: true)
        end
        it 'all lowercase chars (valid)' do
          expect(parser.marc_spec).to parse('...{$a~\\test\\|}', trace: true)
        end
      end
    end
  end
end
