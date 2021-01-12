require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve, RubyParenthesesAfterMethodCallInspection
module MARC
  module Spec
    describe :comparison_string do
      let(:parser) { Parser.new }

      describe 'comparison strings are strings and match pattern' do
        it 'whitespaces are not allowed' do
          expect(parser.comparison_string).not_to parse('te st\\?', trace: true)
        end
        it "unescaped character '$'" do
          expect(parser.comparison_string).not_to parse('test$', trace: true)
        end
        it "unescaped character '}'" do
          expect(parser.comparison_string).not_to parse('te}st', trace: true)
        end
        it "unescaped character '{'" do
          expect(parser.comparison_string).not_to parse('test{', trace: true)
        end
        it "unescaped character '~'" do
          expect(parser.comparison_string).not_to parse('test~', trace: true)
        end
        it "unescaped character '?'" do
          expect(parser.comparison_string).not_to parse('test?', trace: true)
        end
      end
      let(:parser) { Parser.new }

      describe 'comparison strings are strings and match pattern' do
        it 'subfield with single lowercase alpha subfieldtag' do
          expect(parser.comparison_string).to parse('test\\$', trace: true)
        end
        it 'subfield with single lowercase alpha subfieldtag' do
          expect(parser.comparison_string).to parse('test\\{', trace: true)
        end
        it 'subfield with single digit subfieldtag' do
          expect(parser.comparison_string).to parse('te\\}st', trace: true)
        end
        it 'subfieldrange with lowercase subfieldtags' do
          expect(parser.comparison_string).to parse('test\\!', trace: true)
        end
        it 'subfieldrange with lowercase subfieldtags' do
          expect(parser.comparison_string).to parse('\\=test', trace: true)
        end
        it 'subfieldrange with lowercase subfieldtags' do
          expect(parser.comparison_string).to parse('test\\~', trace: true)
        end
        it 'subfieldrange with lowercase subfieldtags' do
          expect(parser.comparison_string).to parse('test\\?', trace: true)
        end
        it 'subfieldrange with lowercase subfieldtags' do
          expect(parser.comparison_string).to parse('tes\\st\\|', trace: true)
        end
        it "unescaped character '=' at beginning is valid" do
          expect(parser.comparison_string).to parse('=test', trace: true)
        end
      end
    end
  end
end
