require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve, RubyParenthesesAfterMethodCallInspection
module MARC
  module Spec
    describe :wild_subfield_tag_range do
      let(:parser) { Parser.new }

      describe 'wild combination of valid field tag, subfield tag and subfield range' do
        it 'lowercase alpha subfieldtag a && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$a$a-z', trace: true)
        end
        it 'lowercase alpha subfieldtag a && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$a$0-9', trace: true)
        end
        it 'lowercase alpha subfieldtag z && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$z$a-z', trace: true)
        end
        it 'lowercase alpha subfieldtag z && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$z$0-9', trace: true)
        end
        it 'digit subfieldtag 0 && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$0$a-z', trace: true)
        end
        it 'digit subfieldtag 0 && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$0$0-9', trace: true)
        end
        it 'digit subfieldtag 9 && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$9$a-z', trace: true)
        end
        it 'digit subfieldtag 9 && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$9$0-9', trace: true)
        end
        it 'subfieldtag ! && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$!$a-z', trace: true)
        end
        it 'subfieldtag ! && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$!$0-9', trace: true)
        end
        it 'subfieldtag # && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$\#$a-z', trace: true)
        end
        it 'subfieldtag # && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$\#$0-9', trace: true)
        end
        it 'subfieldtag $ && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$$$a-z', trace: true)
        end
        it 'subfieldtag $ && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$$$0-9', trace: true)
        end
        it 'subfieldtag % && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$%$a-z', trace: true)
        end
        it 'subfieldtag % && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$%$0-9', trace: true)
        end
        it 'subfieldtag & && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$&$a-z', trace: true)
        end
        it 'subfieldtag & && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$&$0-9', trace: true)
        end
        it "subfieldtag ' && subfield range with lowercase subfieldtags" do
          expect(parser.marc_spec).to parse("...$'$a-z", trace: true)
        end
        it "subfieldtag ' && subfield range with digits" do
          expect(parser.marc_spec).to parse("...$'$0-9", trace: true)
        end
        it 'subfieldtag ( && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$($a-z', trace: true)
        end
        it 'subfieldtag ( && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$($0-9', trace: true)
        end
        it 'subfieldtag ) && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$)$a-z', trace: true)
        end
        it 'subfieldtag ) && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$)$0-9', trace: true)
        end
        it 'subfieldtag * && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$*$a-z', trace: true)
        end
        it 'subfieldtag * && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$*$0-9', trace: true)
        end
        it 'subfieldtag + && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$+$a-z', trace: true)
        end
        it 'subfieldtag + && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$+$0-9', trace: true)
        end
        it 'subfieldtag , && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$,$a-z', trace: true)
        end
        it 'subfieldtag , && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$,$0-9', trace: true)
        end
        it 'subfieldtag - && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$-$a-z', trace: true)
        end
        it 'subfieldtag - && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$-$0-9', trace: true)
        end
        it 'subfieldtag . && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$.$a-z', trace: true)
        end
        it 'subfieldtag . && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$.$0-9', trace: true)
        end
        it 'subfieldtag / && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$/$a-z', trace: true)
        end
        it 'subfieldtag / && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$/$0-9', trace: true)
        end
        it 'subfieldtag : && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$:$a-z', trace: true)
        end
        it 'subfieldtag : && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$:$0-9', trace: true)
        end
        it 'subfieldtag ; && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$;$a-z', trace: true)
        end
        it 'subfieldtag ; && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$;$0-9', trace: true)
        end
        it 'subfieldtag < && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$<$a-z', trace: true)
        end
        it 'subfieldtag < && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$<$0-9', trace: true)
        end
        it 'subfieldtag = && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$=$a-z', trace: true)
        end
        it 'subfieldtag = && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$=$0-9', trace: true)
        end
        it 'subfieldtag > && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$>$a-z', trace: true)
        end
        it 'subfieldtag > && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$>$0-9', trace: true)
        end
        it 'subfieldtag ? && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$?$a-z', trace: true)
        end
        it 'subfieldtag ? && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$?$0-9', trace: true)
        end
        it 'subfieldtag [ && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$[$a-z', trace: true)
        end
        it 'subfieldtag [ && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$[$0-9', trace: true)
        end
        it 'subfieldtag \\ && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$\\$a-z', trace: true)
        end
        it 'subfieldtag \\ && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$\\$0-9', trace: true)
        end
        it 'subfieldtag ] && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$]$a-z', trace: true)
        end
        it 'subfieldtag ] && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$]$0-9', trace: true)
        end
        it 'subfieldtag ^ && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$^$a-z', trace: true)
        end
        it 'subfieldtag ^ && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$^$0-9', trace: true)
        end
        it 'subfieldtag _ && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$_$a-z', trace: true)
        end
        it 'subfieldtag _ && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$_$0-9', trace: true)
        end
        it 'subfieldtag ` && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$`$a-z', trace: true)
        end
        it 'subfieldtag ` && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$`$0-9', trace: true)
        end
        it 'subfieldtag { && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...${$a-z', trace: true)
        end
        it 'subfieldtag { && subfield range with digits' do
          expect(parser.marc_spec).to parse('...${$0-9', trace: true)
        end
        it 'subfieldtag } && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$}$a-z', trace: true)
        end
        it 'subfieldtag } && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$}$0-9', trace: true)
        end
        it 'subfieldtag ~ && subfield range with lowercase subfieldtags' do
          expect(parser.marc_spec).to parse('...$~$a-z', trace: true)
        end
        it 'subfieldtag ~ && subfield range with digits' do
          expect(parser.marc_spec).to parse('...$~$0-9', trace: true)
        end
      end
    end
  end
end
