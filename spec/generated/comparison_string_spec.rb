require 'spec_helper'
require 'parslet/rig/rspec'

module MarcSpec
  module Parsing
    context 'suite' do
      describe :comparison_string do
        let(:parser) { Parser.new }
        let(:reporter) { Parslet::ErrorReporter::Deepest.new }

        describe 'comparison strings are strings and match pattern' do
          # /invalid/invalidComparisonString.json
          it 'subfield with single digit subfieldtag -> valid' do
            # /valid/validComparisonString.json
            expect(parser.comparison_string).to parse('te\\}st', trace: true, reporter: reporter)
          end

          it 'subfield with single lowercase alpha subfieldtag -> valid' do
            # /valid/validComparisonString.json
            expect(parser.comparison_string).to parse('test\\$', trace: true, reporter: reporter)
            expect(parser.comparison_string).to parse('test\\{', trace: true, reporter: reporter)
          end

          it 'subfieldrange with lowercase subfieldtags -> valid' do
            # /valid/validComparisonString.json
            expect(parser.comparison_string).to parse('test\\!', trace: true, reporter: reporter)
            expect(parser.comparison_string).to parse('\\=test', trace: true, reporter: reporter)
            expect(parser.comparison_string).to parse('test\\~', trace: true, reporter: reporter)
            expect(parser.comparison_string).to parse('test\\?', trace: true, reporter: reporter)
            expect(parser.comparison_string).to parse('tes\\st\\|', trace: true, reporter: reporter)
          end

          it "unescaped character '$' -> invalid" do
            # /invalid/invalidComparisonString.json
            expect(parser.comparison_string).not_to parse('test$', trace: true, reporter: reporter)
          end

          it "unescaped character '=' at beginning is valid -> valid" do
            # /valid/validComparisonString.json
            expect(parser.comparison_string).to parse('=test', trace: true, reporter: reporter)
          end

          it "unescaped character '?' -> invalid" do
            # /invalid/invalidComparisonString.json
            expect(parser.comparison_string).not_to parse('test?', trace: true, reporter: reporter)
          end

          it "unescaped character '{' -> invalid" do
            # /invalid/invalidComparisonString.json
            expect(parser.comparison_string).not_to parse('test{', trace: true, reporter: reporter)
          end

          it "unescaped character '}' -> invalid" do
            # /invalid/invalidComparisonString.json
            expect(parser.comparison_string).not_to parse('te}st', trace: true, reporter: reporter)
          end

          it "unescaped character '~' -> invalid" do
            # /invalid/invalidComparisonString.json
            expect(parser.comparison_string).not_to parse('test~', trace: true, reporter: reporter)
          end

          it 'whitespaces are not allowed -> invalid' do
            # /invalid/invalidComparisonString.json
            expect(parser.comparison_string).not_to parse('te st\\?', trace: true, reporter: reporter)
          end

        end
      end
    end
  end
end
