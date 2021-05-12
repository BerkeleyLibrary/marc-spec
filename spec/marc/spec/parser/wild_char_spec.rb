require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve, RubyParenthesesAfterMethodCallInspection
module MARC
  module Spec
    describe :wild_char do
      let(:parser) { Parser.new }

      describe 'wild combination of valid field tag and invalid charspec (valid)' do
        it 'empty string (invalid)' do
          expect(parser.marc_spec).not_to parse('.../', trace: true)
        end
        it 'whitespace is not allowed (invalid)' do
          expect(parser.marc_spec).not_to parse('.../1- 2', trace: true)
        end
        it 'only one hyphen allwed (invalid)' do
          expect(parser.marc_spec).not_to parse('.../1-2-', trace: true)
        end
        it 'missing starting position (invalid)' do
          expect(parser.marc_spec).not_to parse('.../-2', trace: true)
        end
        it "only digits, one hyphen and the char '#' are allowed (invalid)" do
          expect(parser.marc_spec).not_to parse('.../1-X', trace: true)
        end
        it 'missing ending position (invalid)' do
          expect(parser.marc_spec).not_to parse('.../#-', trace: true)
        end
        it 'this matches pattern, but starting position number must not be higher than ending position number (invalid)' do
          expect(parser.marc_spec).not_to parse('.../2-1', trace: true)
        end
        it "only digits, one hyphen and the char '#' are allowed (invalid)" do
          expect(parser.marc_spec).not_to parse('.../?', trace: true)
        end
      end
      let(:parser) { Parser.new }

      describe 'wild combination of valid field tag and charspec (valid)' do
        it 'last position (valid)' do
          expect(parser.marc_spec).to parse('.../#', trace: true)
        end
        it 'first position (valid)' do
          expect(parser.marc_spec).to parse('.../0', trace: true)
        end
        it 'position ten (valid)' do
          expect(parser.marc_spec).to parse('.../9', trace: true)
        end
        it 'position eleven (valid)' do
          expect(parser.marc_spec).to parse('.../10', trace: true)
        end
        it 'position 101 (valid)' do
          expect(parser.marc_spec).to parse('.../100', trace: true)
        end
        it 'range from first position to second (valid)' do
          expect(parser.marc_spec).to parse('.../0-1', trace: true)
        end
        it 'range from first position to last (valid)' do
          expect(parser.marc_spec).to parse('.../0-#', trace: true)
        end
        it 'range from first position to first position, is like first position (valid)' do
          expect(parser.marc_spec).to parse('.../0-0', trace: true)
        end
        it 'range from last position to last position, is like last position (valid)' do
          expect(parser.marc_spec).to parse('.../#-#', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position (valid)' do
          expect(parser.marc_spec).to parse('.../#-0', trace: true)
        end
        it 'range from last position to position two (index reverted) (valid)' do
          expect(parser.marc_spec).to parse('.../#-1', trace: true)
        end
      end
      let(:parser) { Parser.new }

      describe 'wild combination of valid field tag and invalid charspec (invalid)' do
        it 'empty string (invalid)' do
          expect(parser.marc_spec).not_to parse('.../', trace: true)
        end
        it 'whitespace is not allowed (invalid)' do
          expect(parser.marc_spec).not_to parse('.../1- 2', trace: true)
        end
        it 'only one hyphen allwed (invalid)' do
          expect(parser.marc_spec).not_to parse('.../1-2-', trace: true)
        end
        it 'missing starting position (invalid)' do
          expect(parser.marc_spec).not_to parse('.../-2', trace: true)
        end
        it "only digits, one hyphen and the char '#' are allowed (invalid)" do
          expect(parser.marc_spec).not_to parse('.../1-X', trace: true)
        end
        it 'missing ending position (invalid)' do
          expect(parser.marc_spec).not_to parse('.../#-', trace: true)
        end
        it 'this matches pattern, but starting position number must not be higher than ending position number (invalid)' do
          expect(parser.marc_spec).not_to parse('.../2-1', trace: true)
        end
        it "only digits, one hyphen and the char '#' are allowed (invalid)" do
          expect(parser.marc_spec).not_to parse('.../?', trace: true)
        end
      end
    end
  end
end
