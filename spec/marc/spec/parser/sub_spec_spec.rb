require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve
module MARC
  module Spec
    describe Parser do
      let(:parser) { Parser.new }

      describe :sub_spec do
        describe 'subspecs are strings' do
          it 'all wildcards' do
            expect(parser.sub_spec).to parse('{245$a}', trace: true)
          end

          it 'two wildcards left with digit' do
            expect(parser.sub_spec).to parse('{$a}', trace: true)
          end

          it 'one wildcard left with two digits' do
            expect(parser.sub_spec).to parse('{?$a}', trace: true)
          end

          it 'wildcard between digits' do
            expect(parser.sub_spec).to parse('{!$a}', trace: true)
          end

          it 'two digits wildcard right' do
            expect(parser.sub_spec).to parse('{$a=$b}', trace: true)
          end

          it 'one digit two wildcards right' do
            expect(parser.sub_spec).to parse('{$a!=$b}', trace: true)
          end

          it 'all digits' do
            expect(parser.sub_spec).to parse('{$a~\\Poe}', trace: true)
          end

          it 'all uppercase chars special leader' do
            expect(parser.sub_spec).to parse('{$a!~\\Poe}', trace: true)
          end

          it 'two wildcards left one uppercase char' do
            expect(parser.sub_spec).to parse('{/#=\\/}', trace: true)
          end

          it 'one wildcard left two uppercase chars' do
            expect(parser.sub_spec).to parse('{$a|$b}{$c}', trace: true)
          end

          it 'one wildcard between uppercase chars' do
            expect(parser.sub_spec).to parse('{$a}{$b|$c}', trace: true)
          end

          it 'one uppercase char two wildcards right' do
            expect(parser.sub_spec).to parse('{$a|$b}{$c|$d}', trace: true)
          end

          it 'mix one lowercase char and two digits' do
            expect(parser.sub_spec).to parse('{$a|$b|$c}', trace: true)
          end

          it 'mix two lowercase chars and one digit' do
            expect(parser.sub_spec).to parse('{$a~\\test\\$}', trace: true)
          end

          it 'all lowercase chars' do
            expect(parser.sub_spec).to parse('{$a~\\test\\{}', trace: true)
          end

          it 'two wildcards and one lowercase char right' do
            expect(parser.sub_spec).to parse('{$a~\\test\\}}', trace: true)
          end

          it 'one wildcard left and two lowercase chars' do
            expect(parser.sub_spec).to parse('{$a~\\test\\!}', trace: true)
          end

          it 'one lowercase and two wildcards right' do
            expect(parser.sub_spec).to parse('{$a~\\test\\=}', trace: true)
          end

          it 'all lowercase chars' do
            expect(parser.sub_spec).to parse('{$a~\\test\\~}', trace: true)
          end

          it 'all lowercase chars' do
            expect(parser.sub_spec).to parse('{$a~\\test\\?}', trace: true)
          end

          it 'all lowercase chars' do
            expect(parser.sub_spec).to parse('{$a~\\test\\|}', trace: true)
          end
        end

        describe 'wild combination of valid field tag and subspec' do
          it 'all wildcards' do
            expect(parser.marc_spec).to parse('...{245$a}', trace: true)
          end

          it 'two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...{$a}', trace: true)
          end

          it 'one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...{?$a}', trace: true)
          end

          it 'wildcard between digits' do
            expect(parser.marc_spec).to parse('...{!$a}', trace: true)
          end

          it 'two digits wildcard right' do
            expect(parser.marc_spec).to parse('...{$a=$b}', trace: true)
          end

          it 'one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...{$a!=$b}', trace: true)
          end

          it 'all digits' do
            expect(parser.marc_spec).to parse('...{$a~\\Poe}', trace: true)
          end

          it 'all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...{$a!~\\Poe}', trace: true)
          end

          it 'two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...{/#=\\/}', trace: true)
          end

          it 'one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...{$a|$b}{$c}', trace: true)
          end

          it 'one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...{$a}{$b|$c}', trace: true)
          end

          it 'one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...{$a|$b}{$c|$d}', trace: true)
          end

          it 'mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...{$a|$b|$c}', trace: true)
          end

          it 'mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...{$a~\\test\\$}', trace: true)
          end

          it 'all lowercase chars' do
            expect(parser.marc_spec).to parse('...{$a~\\test\\{}', trace: true)
          end

          it 'two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...{$a~\\test\\}}', trace: true)
          end

          it 'one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...{$a~\\test\\!}', trace: true)
          end

          it 'one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...{$a~\\test\\=}', trace: true)
          end

          it 'all lowercase chars' do
            expect(parser.marc_spec).to parse('...{$a~\\test\\~}', trace: true)
          end

          it 'all lowercase chars' do
            expect(parser.marc_spec).to parse('...{$a~\\test\\?}', trace: true)
          end

          it 'all lowercase chars' do
            expect(parser.marc_spec).to parse('...{$a~\\test\\|}', trace: true)
          end
        end
      end
    end
  end
end
