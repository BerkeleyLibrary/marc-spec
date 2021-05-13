require 'spec_helper'
require 'parslet/rig/rspec'

module MARC
  module Spec
    describe :subfield_char do
      let(:parser) { Parser.new }
      let(:reporter) { Parslet::ErrorReporter::Deepest.new }

      describe 'subfield tags are strings and match pattern' do
        it "char '|' is not allowed -> invalid" do
          # /invalid/invalidSubfieldTag.json
          expect(parser.subfield_char).not_to parse('|', trace: true, reporter: reporter)
        end

        it "char 'ß' is not allowed -> invalid" do
          # /invalid/invalidSubfieldTag.json
          expect(parser.subfield_char).not_to parse('ß', trace: true, reporter: reporter)
        end

        it 'digit subfieldtag 0 -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('0', trace: true, reporter: reporter)
        end

        it 'digit subfieldtag 9 -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('9', trace: true, reporter: reporter)
        end

        it 'lowercase alpha subfieldtag a -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('a', trace: true, reporter: reporter)
        end

        it 'lowercase alpha subfieldtag z -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('z', trace: true, reporter: reporter)
        end

        it 'only one digit allowed -> invalid' do
          # /invalid/invalidSubfieldTag.json
          expect(parser.subfield_char).not_to parse('10', trace: true, reporter: reporter)
        end

        it 'subfieldtag ! -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('!', trace: true, reporter: reporter)
        end

        it 'subfieldtag # -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('#', trace: true, reporter: reporter)
        end

        it 'subfieldtag $ -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('$', trace: true, reporter: reporter)
        end

        it 'subfieldtag % -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('%', trace: true, reporter: reporter)
        end

        it 'subfieldtag & -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('&', trace: true, reporter: reporter)
        end

        it "subfieldtag ' -> valid" do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse("'", trace: true, reporter: reporter)
        end

        it 'subfieldtag ( -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('(', trace: true, reporter: reporter)
        end

        it 'subfieldtag ) -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse(')', trace: true, reporter: reporter)
        end

        it 'subfieldtag * -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('*', trace: true, reporter: reporter)
        end

        it 'subfieldtag + -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('+', trace: true, reporter: reporter)
        end

        it 'subfieldtag , -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse(',', trace: true, reporter: reporter)
        end

        it 'subfieldtag - -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('-', trace: true, reporter: reporter)
        end

        it 'subfieldtag . -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('.', trace: true, reporter: reporter)
        end

        it 'subfieldtag / -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('/', trace: true, reporter: reporter)
        end

        it 'subfieldtag : -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse(':', trace: true, reporter: reporter)
        end

        it 'subfieldtag ; -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse(';', trace: true, reporter: reporter)
        end

        it 'subfieldtag < -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('<', trace: true, reporter: reporter)
        end

        it 'subfieldtag = -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('=', trace: true, reporter: reporter)
        end

        it 'subfieldtag > -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('>', trace: true, reporter: reporter)
        end

        it 'subfieldtag ? -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('?', trace: true, reporter: reporter)
        end

        it 'subfieldtag [ -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('[', trace: true, reporter: reporter)
        end

        it 'subfieldtag \\ -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('\\', trace: true, reporter: reporter)
        end

        it 'subfieldtag ] -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse(']', trace: true, reporter: reporter)
        end

        it 'subfieldtag ^ -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('^', trace: true, reporter: reporter)
        end

        it 'subfieldtag _ -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('_', trace: true, reporter: reporter)
        end

        it 'subfieldtag ` -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('`', trace: true, reporter: reporter)
        end

        it 'subfieldtag { -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('{', trace: true, reporter: reporter)
        end

        it 'subfieldtag } -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('}', trace: true, reporter: reporter)
        end

        it 'subfieldtag ~ -> valid' do
          # /valid/validSubfieldTag.json
          expect(parser.subfield_char).to parse('~', trace: true, reporter: reporter)
        end

        it 'uppercase chars are not allowed -> invalid' do
          # /invalid/invalidSubfieldTag.json
          expect(parser.subfield_char).not_to parse('A', trace: true, reporter: reporter)
        end

        it 'whitespace is not allowed -> invalid' do
          # /invalid/invalidSubfieldTag.json
          expect(parser.subfield_char).not_to parse(' a', trace: true, reporter: reporter)
        end

      end
      describe 'valid field tag and invalid subfield tag' do
        it "char '|' is not allowed -> invalid" do
          # /invalid/wildCombination_invalidSubfieldTag.json
          expect(parser.marc_spec).not_to parse('...$|', trace: true, reporter: reporter)
        end

        it "char 'ß' is not allowed -> invalid" do
          # /invalid/wildCombination_invalidSubfieldTag.json
          expect(parser.marc_spec).not_to parse('...$ß', trace: true, reporter: reporter)
        end

        it 'only one digit allowed -> invalid' do
          # /invalid/wildCombination_invalidSubfieldTag.json
          expect(parser.marc_spec).not_to parse('...$10', trace: true, reporter: reporter)
        end

        it 'uppercase chars are not allowed -> invalid' do
          # /invalid/wildCombination_invalidSubfieldTag.json
          expect(parser.marc_spec).not_to parse('...$A', trace: true, reporter: reporter)
        end

        it 'whitespace is not allowed -> invalid' do
          # /invalid/wildCombination_invalidSubfieldTag.json
          expect(parser.marc_spec).not_to parse('...$ a', trace: true, reporter: reporter)
        end

      end
      describe 'valid field tag and subfield tag' do
        it 'digit subfieldtag 0 -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$0', trace: true, reporter: reporter)
        end

        it 'digit subfieldtag 9 -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$9', trace: true, reporter: reporter)
        end

        it 'lowercase alpha subfieldtag a -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$a', trace: true, reporter: reporter)
        end

        it 'lowercase alpha subfieldtag z -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$z', trace: true, reporter: reporter)
        end

        it 'subfieldtag ! -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$!', trace: true, reporter: reporter)
        end

        it 'subfieldtag # -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$#', trace: true, reporter: reporter)
        end

        it 'subfieldtag $ -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$$', trace: true, reporter: reporter)
        end

        it 'subfieldtag % -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$%', trace: true, reporter: reporter)
        end

        it 'subfieldtag & -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$&', trace: true, reporter: reporter)
        end

        it "subfieldtag ' -> valid" do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse("...$'", trace: true, reporter: reporter)
        end

        it 'subfieldtag ( -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$(', trace: true, reporter: reporter)
        end

        it 'subfieldtag ) -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$)', trace: true, reporter: reporter)
        end

        it 'subfieldtag * -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$*', trace: true, reporter: reporter)
        end

        it 'subfieldtag + -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$+', trace: true, reporter: reporter)
        end

        it 'subfieldtag , -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$,', trace: true, reporter: reporter)
        end

        it 'subfieldtag - -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$-', trace: true, reporter: reporter)
        end

        it 'subfieldtag . -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$.', trace: true, reporter: reporter)
        end

        it 'subfieldtag / -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$/', trace: true, reporter: reporter)
        end

        it 'subfieldtag : -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$:', trace: true, reporter: reporter)
        end

        it 'subfieldtag ; -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$;', trace: true, reporter: reporter)
        end

        it 'subfieldtag < -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$<', trace: true, reporter: reporter)
        end

        it 'subfieldtag = -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$=', trace: true, reporter: reporter)
        end

        it 'subfieldtag > -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$>', trace: true, reporter: reporter)
        end

        it 'subfieldtag ? -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$?', trace: true, reporter: reporter)
        end

        it 'subfieldtag [ -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$[', trace: true, reporter: reporter)
        end

        it 'subfieldtag \\ -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$\\', trace: true, reporter: reporter)
        end

        it 'subfieldtag ] -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$]', trace: true, reporter: reporter)
        end

        it 'subfieldtag ^ -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$^', trace: true, reporter: reporter)
        end

        it 'subfieldtag _ -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$_', trace: true, reporter: reporter)
        end

        it 'subfieldtag ` -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$`', trace: true, reporter: reporter)
        end

        it 'subfieldtag { -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...${', trace: true, reporter: reporter)
        end

        it 'subfieldtag } -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$}', trace: true, reporter: reporter)
        end

        it 'subfieldtag ~ -> valid' do
          # /valid/wildCombination_validSubfieldTag.json
          expect(parser.marc_spec).to parse('...$~', trace: true, reporter: reporter)
        end

      end
    end
  end
end
