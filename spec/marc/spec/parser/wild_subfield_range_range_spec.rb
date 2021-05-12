require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve, RubyParenthesesAfterMethodCallInspection
module MARC
  module Spec
    describe :wild_subfield_range_range do
      let(:parser) { Parser.new }

      describe 'wild combination of valid field tag and subfield ranges (valid)' do
        it 'subfield range with lowercase subfieldtags && subfield range with lowercase subfieldtags (valid)' do
          expect(parser.marc_spec).to parse('...$a-z$a-z', trace: true)
        end
        it 'subfield range with lowercase subfieldtags && subfield range with digits (valid)' do
          expect(parser.marc_spec).to parse('...$a-z$0-9', trace: true)
        end
        it 'subfield range with digits && subfield range with lowercase subfieldtags (valid)' do
          expect(parser.marc_spec).to parse('...$0-9$a-z', trace: true)
        end
        it 'subfield range with digits && subfield range with digits (valid)' do
          expect(parser.marc_spec).to parse('...$0-9$0-9', trace: true)
        end
      end
    end
  end
end
