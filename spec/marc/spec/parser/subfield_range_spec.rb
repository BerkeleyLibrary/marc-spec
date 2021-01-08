require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve
module MARC
  module Spec
    describe Parser do
      let(:parser) { Parser.new }

      describe subfield_range do
        describe 'subfield ranges are strings and match pattern' do
          it 'mix of alpha and digit' do
            expect(parser.subfield_range).not_to parse('a-9', trace: true)
          end

          it 'mix of digit and alpha' do
            expect(parser.subfield_range).not_to parse('0-a', trace: true)
          end

          it 'matches the pattern but not a valid subfield tag range' do
            expect(parser.subfield_range).not_to parse('1-0', trace: true)
          end

          it 'matches the pattern but not a valid subfield tag range' do
            expect(parser.subfield_range).not_to parse('z-a', trace: true)
          end

          it 'uppercase chars are not allowed' do
            expect(parser.subfield_range).not_to parse('A-Z', trace: true)
          end
        end

        describe 'subfield ranges are strings and match pattern' do
          it 'subfield range with lowercase subfieldtags' do
            expect(parser.subfield_range).to parse('a-z', trace: true)
          end

          it 'subfield range with digits' do
            expect(parser.subfield_range).to parse('0-9', trace: true)
          end
        end

        describe 'wild combination of valid field tag and invalid subfield range' do
          it 'mix of alpha and digit' do
            expect(parser.marc_spec).not_to parse('...$a-9', trace: true)
          end

          it 'mix of digit and alpha' do
            expect(parser.marc_spec).not_to parse('...$0-a', trace: true)
          end

          it 'matches the pattern but not a valid subfield tag range' do
            expect(parser.marc_spec).not_to parse('...$1-0', trace: true)
          end

          it 'matches the pattern but not a valid subfield tag range' do
            expect(parser.marc_spec).not_to parse('...$z-a', trace: true)
          end

          it 'uppercase chars are not allowed' do
            expect(parser.marc_spec).not_to parse('...$A-Z', trace: true)
          end
        end

        describe 'wild combination of valid field tag and subfield range' do
          it 'subfield range with lowercase subfieldtags' do
            expect(parser.marc_spec).to parse('...$a-z', trace: true)
          end

          it 'subfield range with digits' do
            expect(parser.marc_spec).to parse('...$0-9', trace: true)
          end
        end
      end
    end
  end
end
