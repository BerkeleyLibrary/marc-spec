require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve, RubyParenthesesAfterMethodCallInspection
module MARC
  module Spec
    describe :wild_char_indicator do
      let(:parser) { Parser.new }

      describe 'wild combination of valid field tag and charspec (valid)' do
        it 'last position && indicator 1 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../#^1', trace: true)
        end
        it 'last position && indicator 2 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../#^2', trace: true)
        end
        it 'first position && indicator 1 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../0^1', trace: true)
        end
        it 'first position && indicator 2 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../0^2', trace: true)
        end
        it 'position ten && indicator 1 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../9^1', trace: true)
        end
        it 'position ten && indicator 2 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../9^2', trace: true)
        end
        it 'position eleven && indicator 1 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../10^1', trace: true)
        end
        it 'position eleven && indicator 2 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../10^2', trace: true)
        end
        it 'position 101 && indicator 1 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../100^1', trace: true)
        end
        it 'position 101 && indicator 2 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../100^2', trace: true)
        end
        it 'range from first position to second && indicator 1 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../0-1^1', trace: true)
        end
        it 'range from first position to second && indicator 2 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../0-1^2', trace: true)
        end
        it 'range from first position to last && indicator 1 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../0-#^1', trace: true)
        end
        it 'range from first position to last && indicator 2 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../0-#^2', trace: true)
        end
        it 'range from first position to first position, is like first position && indicator 1 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../0-0^1', trace: true)
        end
        it 'range from first position to first position, is like first position && indicator 2 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../0-0^2', trace: true)
        end
        it 'range from last position to last position, is like last position && indicator 1 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../#-#^1', trace: true)
        end
        it 'range from last position to last position, is like last position && indicator 2 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../#-#^2', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && indicator 1 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../#-0^1', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && indicator 2 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../#-0^2', trace: true)
        end
        it 'range from last position to position two (index reverted) && indicator 1 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../#-1^1', trace: true)
        end
        it 'range from last position to position two (index reverted) && indicator 2 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../#-1^2', trace: true)
        end
      end
      let(:parser) { Parser.new }

      describe 'wild combination of valid field tag and charspec (invalid)' do
        it 'last position && indicator 1 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../#^1', trace: true)
        end
        it 'last position && indicator 2 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../#^2', trace: true)
        end
        it 'first position && indicator 1 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../0^1', trace: true)
        end
        it 'first position && indicator 2 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../0^2', trace: true)
        end
        it 'position ten && indicator 1 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../9^1', trace: true)
        end
        it 'position ten && indicator 2 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../9^2', trace: true)
        end
        it 'position eleven && indicator 1 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../10^1', trace: true)
        end
        it 'position eleven && indicator 2 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../10^2', trace: true)
        end
        it 'position 101 && indicator 1 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../100^1', trace: true)
        end
        it 'position 101 && indicator 2 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../100^2', trace: true)
        end
        it 'range from first position to second && indicator 1 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../0-1^1', trace: true)
        end
        it 'range from first position to second && indicator 2 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../0-1^2', trace: true)
        end
        it 'range from first position to last && indicator 1 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../0-#^1', trace: true)
        end
        it 'range from first position to last && indicator 2 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../0-#^2', trace: true)
        end
        it 'range from first position to first position, is like first position && indicator 1 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../0-0^1', trace: true)
        end
        it 'range from first position to first position, is like first position && indicator 2 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../0-0^2', trace: true)
        end
        it 'range from last position to last position, is like last position && indicator 1 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../#-#^1', trace: true)
        end
        it 'range from last position to last position, is like last position && indicator 2 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../#-#^2', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && indicator 1 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../#-0^1', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && indicator 2 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../#-0^2', trace: true)
        end
        it 'range from last position to position two (index reverted) && indicator 1 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../#-1^1', trace: true)
        end
        it 'range from last position to position two (index reverted) && indicator 2 (invalid)' do
          expect(parser.marc_spec).not_to parse('.../#-1^2', trace: true)
        end
      end
    end
  end
end
