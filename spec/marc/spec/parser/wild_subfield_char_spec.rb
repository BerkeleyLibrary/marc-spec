require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve, RubyParenthesesAfterMethodCallInspection
module MARC
  module Spec
    describe :wild_subfield_char do
      let(:parser) { Parser.new }

      describe 'wild combination of valid field tag and invalid subfield tag' do
        it 'whitespace is not allowed' do
          expect(parser.marc_spec).not_to parse('...$ a', trace: true)
        end
        it "char 'ß' is not allowed" do
          expect(parser.marc_spec).not_to parse('...$ß', trace: true)
        end
        it "char '|' is not allowed" do
          expect(parser.marc_spec).not_to parse('...$|', trace: true)
        end
        it 'uppercase chars are not allowed' do
          expect(parser.marc_spec).not_to parse('...$A', trace: true)
        end
        it 'only one digit allowed' do
          expect(parser.marc_spec).not_to parse('...$10', trace: true)
        end
      end
      let(:parser) { Parser.new }

      describe 'wild combination of valid field tag and subfield tag' do
        it 'lowercase alpha subfieldtag a' do
          expect(parser.marc_spec).to parse('...$a', trace: true)
        end
        it 'lowercase alpha subfieldtag z' do
          expect(parser.marc_spec).to parse('...$z', trace: true)
        end
        it 'digit subfieldtag 0' do
          expect(parser.marc_spec).to parse('...$0', trace: true)
        end
        it 'digit subfieldtag 9' do
          expect(parser.marc_spec).to parse('...$9', trace: true)
        end
        it 'subfieldtag !' do
          expect(parser.marc_spec).to parse('...$!', trace: true)
        end
        it 'subfieldtag #' do
          expect(parser.marc_spec).to parse('...$#', trace: true)
        end
        it 'subfieldtag $' do
          expect(parser.marc_spec).to parse('...$$', trace: true)
        end
        it 'subfieldtag %' do
          expect(parser.marc_spec).to parse('...$%', trace: true)
        end
        it 'subfieldtag &' do
          expect(parser.marc_spec).to parse('...$&', trace: true)
        end
        it "subfieldtag '" do
          expect(parser.marc_spec).to parse("...$'", trace: true)
        end
        it 'subfieldtag (' do
          expect(parser.marc_spec).to parse('...$(', trace: true)
        end
        it 'subfieldtag )' do
          expect(parser.marc_spec).to parse('...$)', trace: true)
        end
        it 'subfieldtag *' do
          expect(parser.marc_spec).to parse('...$*', trace: true)
        end
        it 'subfieldtag +' do
          expect(parser.marc_spec).to parse('...$+', trace: true)
        end
        it 'subfieldtag ,' do
          expect(parser.marc_spec).to parse('...$,', trace: true)
        end
        it 'subfieldtag -' do
          expect(parser.marc_spec).to parse('...$-', trace: true)
        end
        it 'subfieldtag .' do
          expect(parser.marc_spec).to parse('...$.', trace: true)
        end
        it 'subfieldtag /' do
          expect(parser.marc_spec).to parse('...$/', trace: true)
        end
        it 'subfieldtag :' do
          expect(parser.marc_spec).to parse('...$:', trace: true)
        end
        it 'subfieldtag ;' do
          expect(parser.marc_spec).to parse('...$;', trace: true)
        end
        it 'subfieldtag <' do
          expect(parser.marc_spec).to parse('...$<', trace: true)
        end
        it 'subfieldtag =' do
          expect(parser.marc_spec).to parse('...$=', trace: true)
        end
        it 'subfieldtag >' do
          expect(parser.marc_spec).to parse('...$>', trace: true)
        end
        it 'subfieldtag ?' do
          expect(parser.marc_spec).to parse('...$?', trace: true)
        end
        it 'subfieldtag [' do
          expect(parser.marc_spec).to parse('...$[', trace: true)
        end
        it 'subfieldtag \\' do
          expect(parser.marc_spec).to parse('...$\\', trace: true)
        end
        it 'subfieldtag ]' do
          expect(parser.marc_spec).to parse('...$]', trace: true)
        end
        it 'subfieldtag ^' do
          expect(parser.marc_spec).to parse('...$^', trace: true)
        end
        it 'subfieldtag _' do
          expect(parser.marc_spec).to parse('...$_', trace: true)
        end
        it 'subfieldtag `' do
          expect(parser.marc_spec).to parse('...$`', trace: true)
        end
        it 'subfieldtag {' do
          expect(parser.marc_spec).to parse('...${', trace: true)
        end
        it 'subfieldtag }' do
          expect(parser.marc_spec).to parse('...$}', trace: true)
        end
        it 'subfieldtag ~' do
          expect(parser.marc_spec).to parse('...$~', trace: true)
        end
      end
    end
  end
end
