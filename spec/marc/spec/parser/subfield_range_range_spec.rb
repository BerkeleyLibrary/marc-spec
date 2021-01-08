require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve
module MARC
  module Spec
    describe Parser do
      let(:parser) { Parser.new }

      describe subfield_range_range do
        describe 'wild combination of valid field tag and subfield ranges' do
          it 'subfield range with lowercase subfieldtags && subfield range with lowercase subfieldtags' do
            expect(parser.marc_spec).to parse('...$a-z$a-z', trace: true)
          end

          it 'subfield range with lowercase subfieldtags && subfield range with digits' do
            expect(parser.marc_spec).to parse('...$a-z$0-9', trace: true)
          end

          it 'subfield range with digits && subfield range with lowercase subfieldtags' do
            expect(parser.marc_spec).to parse('...$0-9$a-z', trace: true)
          end

          it 'subfield range with digits && subfield range with digits' do
            expect(parser.marc_spec).to parse('...$0-9$0-9', trace: true)
          end
        end
      end
    end
  end
end
