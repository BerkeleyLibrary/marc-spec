require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve, RubyParenthesesAfterMethodCallInspection
module MARC
  module Spec
    describe :subfield_char do
      let(:parser) { Parser.new }

      describe 'subfield tags are strings and match pattern' do
        it 'whitespace is not allowed' do
          expect(parser.subfield_char).not_to parse(' a', trace: true)
        end
        it "char 'ß' is not allowed" do
          expect(parser.subfield_char).not_to parse('ß', trace: true)
        end
        it "char '|' is not allowed" do
          expect(parser.subfield_char).not_to parse('|', trace: true)
        end
        it 'uppercase chars are not allowed' do
          expect(parser.subfield_char).not_to parse('A', trace: true)
        end
        it 'only one digit allowed' do
          expect(parser.subfield_char).not_to parse('10', trace: true)
        end
      end
      let(:parser) { Parser.new }

      describe 'subfield tags are strings and match pattern' do
        it 'lowercase alpha subfieldtag a' do
          expect(parser.subfield_char).to parse('a', trace: true)
        end
        it 'lowercase alpha subfieldtag z' do
          expect(parser.subfield_char).to parse('z', trace: true)
        end
        it 'digit subfieldtag 0' do
          expect(parser.subfield_char).to parse('0', trace: true)
        end
        it 'digit subfieldtag 9' do
          expect(parser.subfield_char).to parse('9', trace: true)
        end
        it 'subfieldtag !' do
          expect(parser.subfield_char).to parse('!', trace: true)
        end
        it 'subfieldtag #' do
          expect(parser.subfield_char).to parse('#', trace: true)
        end
        it 'subfieldtag $' do
          expect(parser.subfield_char).to parse('$', trace: true)
        end
        it 'subfieldtag %' do
          expect(parser.subfield_char).to parse('%', trace: true)
        end
        it 'subfieldtag &' do
          expect(parser.subfield_char).to parse('&', trace: true)
        end
        it "subfieldtag '" do
          expect(parser.subfield_char).to parse("'", trace: true)
        end
        it 'subfieldtag (' do
          expect(parser.subfield_char).to parse('(', trace: true)
        end
        it 'subfieldtag )' do
          expect(parser.subfield_char).to parse(')', trace: true)
        end
        it 'subfieldtag *' do
          expect(parser.subfield_char).to parse('*', trace: true)
        end
        it 'subfieldtag +' do
          expect(parser.subfield_char).to parse('+', trace: true)
        end
        it 'subfieldtag ,' do
          expect(parser.subfield_char).to parse(',', trace: true)
        end
        it 'subfieldtag -' do
          expect(parser.subfield_char).to parse('-', trace: true)
        end
        it 'subfieldtag .' do
          expect(parser.subfield_char).to parse('.', trace: true)
        end
        it 'subfieldtag /' do
          expect(parser.subfield_char).to parse('/', trace: true)
        end
        it 'subfieldtag :' do
          expect(parser.subfield_char).to parse(':', trace: true)
        end
        it 'subfieldtag ;' do
          expect(parser.subfield_char).to parse(';', trace: true)
        end
        it 'subfieldtag <' do
          expect(parser.subfield_char).to parse('<', trace: true)
        end
        it 'subfieldtag =' do
          expect(parser.subfield_char).to parse('=', trace: true)
        end
        it 'subfieldtag >' do
          expect(parser.subfield_char).to parse('>', trace: true)
        end
        it 'subfieldtag ?' do
          expect(parser.subfield_char).to parse('?', trace: true)
        end
        it 'subfieldtag [' do
          expect(parser.subfield_char).to parse('[', trace: true)
        end
        it 'subfieldtag \\' do
          expect(parser.subfield_char).to parse('\\', trace: true)
        end
        it 'subfieldtag ]' do
          expect(parser.subfield_char).to parse(']', trace: true)
        end
        it 'subfieldtag ^' do
          expect(parser.subfield_char).to parse('^', trace: true)
        end
        it 'subfieldtag _' do
          expect(parser.subfield_char).to parse('_', trace: true)
        end
        it 'subfieldtag `' do
          expect(parser.subfield_char).to parse('`', trace: true)
        end
        it 'subfieldtag {' do
          expect(parser.subfield_char).to parse('{', trace: true)
        end
        it 'subfieldtag }' do
          expect(parser.subfield_char).to parse('}', trace: true)
        end
        it 'subfieldtag ~' do
          expect(parser.subfield_char).to parse('~', trace: true)
        end
      end
    end
  end
end
