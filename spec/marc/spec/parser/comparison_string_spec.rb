require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve, RubyParenthesesAfterMethodCallInspection
module MARC
  module Spec
    describe :comparison_string do
      let(:parser) { Parser.new }

      describe 'comparison strings are strings and match pattern (valid)' do
        it 'whitespaces are not allowed (invalid)' do
          expect(parser.comparison_string).not_to parse('te st\\?', trace: true)
        end
        it "unescaped character '$' (invalid)" do
          expect(parser.comparison_string).not_to parse('test$', trace: true)
        end
        it "unescaped character '}' (invalid)" do
          expect(parser.comparison_string).not_to parse('te}st', trace: true)
        end
        it "unescaped character '{' (invalid)" do
          expect(parser.comparison_string).not_to parse('test{', trace: true)
        end
        it "unescaped character '~' (invalid)" do
          expect(parser.comparison_string).not_to parse('test~', trace: true)
        end
        it "unescaped character '?' (invalid)" do
          expect(parser.comparison_string).not_to parse('test?', trace: true)
        end
      end
      let(:parser) { Parser.new }

      describe 'comparison strings are strings and match pattern (valid)' do
        it 'subfield with single lowercase alpha subfieldtag (valid)' do
          expect(parser.comparison_string).to parse('test\\$', trace: true)
        end
        it 'subfield with single lowercase alpha subfieldtag (valid)' do
          expect(parser.comparison_string).to parse('test\\{', trace: true)
        end
        it 'subfield with single digit subfieldtag (valid)' do
          expect(parser.comparison_string).to parse('te\\}st', trace: true)
        end
        it 'subfieldrange with lowercase subfieldtags (valid)' do
          expect(parser.comparison_string).to parse('test\\!', trace: true)
        end
        it 'subfieldrange with lowercase subfieldtags (valid)' do
          expect(parser.comparison_string).to parse('\\=test', trace: true)
        end
        it 'subfieldrange with lowercase subfieldtags (valid)' do
          expect(parser.comparison_string).to parse('test\\~', trace: true)
        end
        it 'subfieldrange with lowercase subfieldtags (valid)' do
          expect(parser.comparison_string).to parse('test\\?', trace: true)
        end
        it 'subfieldrange with lowercase subfieldtags (valid)' do
          expect(parser.comparison_string).to parse('tes\\st\\|', trace: true)
        end
        it "unescaped character '=' at beginning is valid (valid)" do
          expect(parser.comparison_string).to parse('=test', trace: true)
        end
      end
      let(:parser) { Parser.new }

      describe 'comparison strings are strings and match pattern (invalid)' do
        it 'whitespaces are not allowed (invalid)' do
          expect(parser.comparison_string).not_to parse('te st\\?', trace: true)
        end
        it "unescaped character '$' (invalid)" do
          expect(parser.comparison_string).not_to parse('test$', trace: true)
        end
        it "unescaped character '}' (invalid)" do
          expect(parser.comparison_string).not_to parse('te}st', trace: true)
        end
        it "unescaped character '{' (invalid)" do
          expect(parser.comparison_string).not_to parse('test{', trace: true)
        end
        it "unescaped character '~' (invalid)" do
          expect(parser.comparison_string).not_to parse('test~', trace: true)
        end
        it "unescaped character '?' (invalid)" do
          expect(parser.comparison_string).not_to parse('test?', trace: true)
        end
      end
    end
  end
end
