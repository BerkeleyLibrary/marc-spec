require 'spec_helper'
require 'parslet/rig/rspec'

module BerkeleyLibrary
  module MarcSpec
    context 'generated' do
      describe :subfield_tag_range do
        let(:parser) { Parser.new }
        let(:reporter) { Parslet::ErrorReporter::Deepest.new }

        describe 'marc_spec: valid field tag, subfield tag and subfield range' do
          # /valid/wildCombination_validSubfieldTagRange.json
          it 'subfieldtag & && subfield range with digits -> valid' do
            # /valid/wildCombination_validSubfieldTagRange.json
            expect(parser.marc_spec).to parse('...$&$0-9', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfield range with lowercase subfieldtags -> valid' do
            # /valid/wildCombination_validSubfieldTagRange.json
            expect(parser.marc_spec).to parse('...$&$a-z', trace: true, reporter: reporter)
          end

          describe 'lowercase alpha subfieldtag a' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$a$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$a$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'lowercase alpha subfieldtag z' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$z$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$z$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'digit subfieldtag 0' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$0$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$0$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'digit subfieldtag 9' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$9$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$9$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag !' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$!$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$!$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag #' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse("...$\#$0-9", trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse("...$\#$a-z", trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag $' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$$$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$$$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag %' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$%$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$%$a-z', trace: true, reporter: reporter)
            end

          end

          describe "subfieldtag '" do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse("...$'$0-9", trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse("...$'$a-z", trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag (' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$($0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$($a-z', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag )' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$)$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$)$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag *' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$*$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$*$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag +' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$+$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$+$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag ,' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$,$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$,$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag -' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$-$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$-$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag .' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$.$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$.$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag /' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$/$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$/$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag :' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$:$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$:$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag ;' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$;$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$;$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag <' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$<$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$<$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag =' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$=$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$=$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag >' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$>$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$>$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag ?' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$?$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$?$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag [' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$[$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$[$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag \\' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$\\$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$\\$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag ]' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$]$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$]$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag ^' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$^$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$^$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag _' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$_$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$_$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag `' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$`$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$`$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag {' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...${$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...${$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag }' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$}$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$}$a-z', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag ~' do

            it '&& subfield range with digits -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$~$0-9', trace: true, reporter: reporter)
            end

            it '&& subfield range with lowercase subfieldtags -> valid' do
              # /valid/wildCombination_validSubfieldTagRange.json
              expect(parser.marc_spec).to parse('...$~$a-z', trace: true, reporter: reporter)
            end

          end

        end
      end
    end
  end
end
