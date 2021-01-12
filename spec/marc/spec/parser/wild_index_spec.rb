require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve, RubyParenthesesAfterMethodCallInspection
module MARC
  module Spec
    describe :wild_index do
      let(:parser) { Parser.new }

      describe 'wild combination of valid field tag and invalid index' do
        it 'empty string' do
          expect(parser.marc_spec).not_to parse('...[]', trace: true)
        end
        it 'whitespace is not allowed' do
          expect(parser.marc_spec).not_to parse('...[1- 2]', trace: true)
        end
        it 'only one hyphen allwed' do
          expect(parser.marc_spec).not_to parse('...[1-2-]', trace: true)
        end
        it 'missing starting position' do
          expect(parser.marc_spec).not_to parse('...[-2]', trace: true)
        end
        it "only digits, one hyphen and the char '#' are allowed" do
          expect(parser.marc_spec).not_to parse('...[1-X]', trace: true)
        end
        it 'missing ending position' do
          expect(parser.marc_spec).not_to parse('...[#-]', trace: true)
        end
        it 'this matches pattern, but starting position number must not be higher than ending position number' do
          expect(parser.marc_spec).not_to parse('...[2-1]', trace: true)
        end
        it "only digits, one hyphen and the char '#' are allowed" do
          expect(parser.marc_spec).not_to parse('...[?]', trace: true)
        end
      end
      let(:parser) { Parser.new }

      describe 'wild combination of valid field tag and index' do
        it 'last position' do
          expect(parser.marc_spec).to parse('...[#]', trace: true)
        end
        it 'first position' do
          expect(parser.marc_spec).to parse('...[0]', trace: true)
        end
        it 'position ten' do
          expect(parser.marc_spec).to parse('...[9]', trace: true)
        end
        it 'position eleven' do
          expect(parser.marc_spec).to parse('...[10]', trace: true)
        end
        it 'position 101' do
          expect(parser.marc_spec).to parse('...[100]', trace: true)
        end
        it 'range from first position to second' do
          expect(parser.marc_spec).to parse('...[0-1]', trace: true)
        end
        it 'range from first position to last' do
          expect(parser.marc_spec).to parse('...[0-#]', trace: true)
        end
        it 'range from first position to first position, is like first position' do
          expect(parser.marc_spec).to parse('...[0-0]', trace: true)
        end
        it 'range from last position to last position, is like last position' do
          expect(parser.marc_spec).to parse('...[#-#]', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position' do
          expect(parser.marc_spec).to parse('...[#-0]', trace: true)
        end
        it 'range from last position to position two (index reverted)' do
          expect(parser.marc_spec).to parse('...[#-1]', trace: true)
        end
      end
    end
  end
end
