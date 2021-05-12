require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve, RubyParenthesesAfterMethodCallInspection
module MARC
  module Spec
    describe :wild_index_char do
      let(:parser) { Parser.new }

      describe 'wild combination of valid field tag, index and charspec (valid)' do
        it 'last position && last position (valid)' do
          expect(parser.marc_spec).to parse('...[#]/#', trace: true)
        end
        it 'last position && first position (valid)' do
          expect(parser.marc_spec).to parse('...[#]/0', trace: true)
        end
        it 'last position && position ten (valid)' do
          expect(parser.marc_spec).to parse('...[#]/9', trace: true)
        end
        it 'last position && position eleven (valid)' do
          expect(parser.marc_spec).to parse('...[#]/10', trace: true)
        end
        it 'last position && position 101 (valid)' do
          expect(parser.marc_spec).to parse('...[#]/100', trace: true)
        end
        it 'last position && range from first position to second (valid)' do
          expect(parser.marc_spec).to parse('...[#]/0-1', trace: true)
        end
        it 'last position && range from first position to last (valid)' do
          expect(parser.marc_spec).to parse('...[#]/0-#', trace: true)
        end
        it 'last position && range from first position to first position, is like first position (valid)' do
          expect(parser.marc_spec).to parse('...[#]/0-0', trace: true)
        end
        it 'last position && range from last position to last position, is like last position (valid)' do
          expect(parser.marc_spec).to parse('...[#]/#-#', trace: true)
        end
        it 'last position && range from last position to position one (index reverted), is like last position (valid)' do
          expect(parser.marc_spec).to parse('...[#]/#-0', trace: true)
        end
        it 'last position && range from last position to position two (index reverted) (valid)' do
          expect(parser.marc_spec).to parse('...[#]/#-1', trace: true)
        end
        it 'first position && last position (valid)' do
          expect(parser.marc_spec).to parse('...[0]/#', trace: true)
        end
        it 'first position && first position (valid)' do
          expect(parser.marc_spec).to parse('...[0]/0', trace: true)
        end
        it 'first position && position ten (valid)' do
          expect(parser.marc_spec).to parse('...[0]/9', trace: true)
        end
        it 'first position && position eleven (valid)' do
          expect(parser.marc_spec).to parse('...[0]/10', trace: true)
        end
        it 'first position && position 101 (valid)' do
          expect(parser.marc_spec).to parse('...[0]/100', trace: true)
        end
        it 'first position && range from first position to second (valid)' do
          expect(parser.marc_spec).to parse('...[0]/0-1', trace: true)
        end
        it 'first position && range from first position to last (valid)' do
          expect(parser.marc_spec).to parse('...[0]/0-#', trace: true)
        end
        it 'first position && range from first position to first position, is like first position (valid)' do
          expect(parser.marc_spec).to parse('...[0]/0-0', trace: true)
        end
        it 'first position && range from last position to last position, is like last position (valid)' do
          expect(parser.marc_spec).to parse('...[0]/#-#', trace: true)
        end
        it 'first position && range from last position to position one (index reverted), is like last position (valid)' do
          expect(parser.marc_spec).to parse('...[0]/#-0', trace: true)
        end
        it 'first position && range from last position to position two (index reverted) (valid)' do
          expect(parser.marc_spec).to parse('...[0]/#-1', trace: true)
        end
        it 'position ten && last position (valid)' do
          expect(parser.marc_spec).to parse('...[9]/#', trace: true)
        end
        it 'position ten && first position (valid)' do
          expect(parser.marc_spec).to parse('...[9]/0', trace: true)
        end
        it 'position ten && position ten (valid)' do
          expect(parser.marc_spec).to parse('...[9]/9', trace: true)
        end
        it 'position ten && position eleven (valid)' do
          expect(parser.marc_spec).to parse('...[9]/10', trace: true)
        end
        it 'position ten && position 101 (valid)' do
          expect(parser.marc_spec).to parse('...[9]/100', trace: true)
        end
        it 'position ten && range from first position to second (valid)' do
          expect(parser.marc_spec).to parse('...[9]/0-1', trace: true)
        end
        it 'position ten && range from first position to last (valid)' do
          expect(parser.marc_spec).to parse('...[9]/0-#', trace: true)
        end
        it 'position ten && range from first position to first position, is like first position (valid)' do
          expect(parser.marc_spec).to parse('...[9]/0-0', trace: true)
        end
        it 'position ten && range from last position to last position, is like last position (valid)' do
          expect(parser.marc_spec).to parse('...[9]/#-#', trace: true)
        end
        it 'position ten && range from last position to position one (index reverted), is like last position (valid)' do
          expect(parser.marc_spec).to parse('...[9]/#-0', trace: true)
        end
        it 'position ten && range from last position to position two (index reverted) (valid)' do
          expect(parser.marc_spec).to parse('...[9]/#-1', trace: true)
        end
        it 'position eleven && last position (valid)' do
          expect(parser.marc_spec).to parse('...[10]/#', trace: true)
        end
        it 'position eleven && first position (valid)' do
          expect(parser.marc_spec).to parse('...[10]/0', trace: true)
        end
        it 'position eleven && position ten (valid)' do
          expect(parser.marc_spec).to parse('...[10]/9', trace: true)
        end
        it 'position eleven && position eleven (valid)' do
          expect(parser.marc_spec).to parse('...[10]/10', trace: true)
        end
        it 'position eleven && position 101 (valid)' do
          expect(parser.marc_spec).to parse('...[10]/100', trace: true)
        end
        it 'position eleven && range from first position to second (valid)' do
          expect(parser.marc_spec).to parse('...[10]/0-1', trace: true)
        end
        it 'position eleven && range from first position to last (valid)' do
          expect(parser.marc_spec).to parse('...[10]/0-#', trace: true)
        end
        it 'position eleven && range from first position to first position, is like first position (valid)' do
          expect(parser.marc_spec).to parse('...[10]/0-0', trace: true)
        end
        it 'position eleven && range from last position to last position, is like last position (valid)' do
          expect(parser.marc_spec).to parse('...[10]/#-#', trace: true)
        end
        it 'position eleven && range from last position to position one (index reverted), is like last position (valid)' do
          expect(parser.marc_spec).to parse('...[10]/#-0', trace: true)
        end
        it 'position eleven && range from last position to position two (index reverted) (valid)' do
          expect(parser.marc_spec).to parse('...[10]/#-1', trace: true)
        end
        it 'position 101 && last position (valid)' do
          expect(parser.marc_spec).to parse('...[100]/#', trace: true)
        end
        it 'position 101 && first position (valid)' do
          expect(parser.marc_spec).to parse('...[100]/0', trace: true)
        end
        it 'position 101 && position ten (valid)' do
          expect(parser.marc_spec).to parse('...[100]/9', trace: true)
        end
        it 'position 101 && position eleven (valid)' do
          expect(parser.marc_spec).to parse('...[100]/10', trace: true)
        end
        it 'position 101 && position 101 (valid)' do
          expect(parser.marc_spec).to parse('...[100]/100', trace: true)
        end
        it 'position 101 && range from first position to second (valid)' do
          expect(parser.marc_spec).to parse('...[100]/0-1', trace: true)
        end
        it 'position 101 && range from first position to last (valid)' do
          expect(parser.marc_spec).to parse('...[100]/0-#', trace: true)
        end
        it 'position 101 && range from first position to first position, is like first position (valid)' do
          expect(parser.marc_spec).to parse('...[100]/0-0', trace: true)
        end
        it 'position 101 && range from last position to last position, is like last position (valid)' do
          expect(parser.marc_spec).to parse('...[100]/#-#', trace: true)
        end
        it 'position 101 && range from last position to position one (index reverted), is like last position (valid)' do
          expect(parser.marc_spec).to parse('...[100]/#-0', trace: true)
        end
        it 'position 101 && range from last position to position two (index reverted) (valid)' do
          expect(parser.marc_spec).to parse('...[100]/#-1', trace: true)
        end
        it 'range from first position to second && last position (valid)' do
          expect(parser.marc_spec).to parse('...[0-1]/#', trace: true)
        end
        it 'range from first position to second && first position (valid)' do
          expect(parser.marc_spec).to parse('...[0-1]/0', trace: true)
        end
        it 'range from first position to second && position ten (valid)' do
          expect(parser.marc_spec).to parse('...[0-1]/9', trace: true)
        end
        it 'range from first position to second && position eleven (valid)' do
          expect(parser.marc_spec).to parse('...[0-1]/10', trace: true)
        end
        it 'range from first position to second && position 101 (valid)' do
          expect(parser.marc_spec).to parse('...[0-1]/100', trace: true)
        end
        it 'range from first position to second && range from first position to second (valid)' do
          expect(parser.marc_spec).to parse('...[0-1]/0-1', trace: true)
        end
        it 'range from first position to second && range from first position to last (valid)' do
          expect(parser.marc_spec).to parse('...[0-1]/0-#', trace: true)
        end
        it 'range from first position to second && range from first position to first position, is like first position (valid)' do
          expect(parser.marc_spec).to parse('...[0-1]/0-0', trace: true)
        end
        it 'range from first position to second && range from last position to last position, is like last position (valid)' do
          expect(parser.marc_spec).to parse('...[0-1]/#-#', trace: true)
        end
        it 'range from first position to second && range from last position to position one (index reverted), is like last position (valid)' do
          expect(parser.marc_spec).to parse('...[0-1]/#-0', trace: true)
        end
        it 'range from first position to second && range from last position to position two (index reverted) (valid)' do
          expect(parser.marc_spec).to parse('...[0-1]/#-1', trace: true)
        end
        it 'range from first position to last && last position (valid)' do
          expect(parser.marc_spec).to parse('...[0-#]/#', trace: true)
        end
        it 'range from first position to last && first position (valid)' do
          expect(parser.marc_spec).to parse('...[0-#]/0', trace: true)
        end
        it 'range from first position to last && position ten (valid)' do
          expect(parser.marc_spec).to parse('...[0-#]/9', trace: true)
        end
        it 'range from first position to last && position eleven (valid)' do
          expect(parser.marc_spec).to parse('...[0-#]/10', trace: true)
        end
        it 'range from first position to last && position 101 (valid)' do
          expect(parser.marc_spec).to parse('...[0-#]/100', trace: true)
        end
        it 'range from first position to last && range from first position to second (valid)' do
          expect(parser.marc_spec).to parse('...[0-#]/0-1', trace: true)
        end
        it 'range from first position to last && range from first position to last (valid)' do
          expect(parser.marc_spec).to parse('...[0-#]/0-#', trace: true)
        end
        it 'range from first position to last && range from first position to first position, is like first position (valid)' do
          expect(parser.marc_spec).to parse('...[0-#]/0-0', trace: true)
        end
        it 'range from first position to last && range from last position to last position, is like last position (valid)' do
          expect(parser.marc_spec).to parse('...[0-#]/#-#', trace: true)
        end
        it 'range from first position to last && range from last position to position one (index reverted), is like last position (valid)' do
          expect(parser.marc_spec).to parse('...[0-#]/#-0', trace: true)
        end
        it 'range from first position to last && range from last position to position two (index reverted) (valid)' do
          expect(parser.marc_spec).to parse('...[0-#]/#-1', trace: true)
        end
        it 'range from first position to first position, is like first position && last position (valid)' do
          expect(parser.marc_spec).to parse('...[0-0]/#', trace: true)
        end
        it 'range from first position to first position, is like first position && first position (valid)' do
          expect(parser.marc_spec).to parse('...[0-0]/0', trace: true)
        end
        it 'range from first position to first position, is like first position && position ten (valid)' do
          expect(parser.marc_spec).to parse('...[0-0]/9', trace: true)
        end
        it 'range from first position to first position, is like first position && position eleven (valid)' do
          expect(parser.marc_spec).to parse('...[0-0]/10', trace: true)
        end
        it 'range from first position to first position, is like first position && position 101 (valid)' do
          expect(parser.marc_spec).to parse('...[0-0]/100', trace: true)
        end
        it 'range from first position to first position, is like first position && range from first position to second (valid)' do
          expect(parser.marc_spec).to parse('...[0-0]/0-1', trace: true)
        end
        it 'range from first position to first position, is like first position && range from first position to last (valid)' do
          expect(parser.marc_spec).to parse('...[0-0]/0-#', trace: true)
        end
        it 'range from first position to first position, is like first position && range from first position to first position, is like first position (valid)' do
          expect(parser.marc_spec).to parse('...[0-0]/0-0', trace: true)
        end
        it 'range from first position to first position, is like first position && range from last position to last position, is like last position (valid)' do
          expect(parser.marc_spec).to parse('...[0-0]/#-#', trace: true)
        end
        it 'range from first position to first position, is like first position && range from last position to position one (index reverted), is like last position (valid)' do
          expect(parser.marc_spec).to parse('...[0-0]/#-0', trace: true)
        end
        it 'range from first position to first position, is like first position && range from last position to position two (index reverted) (valid)' do
          expect(parser.marc_spec).to parse('...[0-0]/#-1', trace: true)
        end
        it 'range from last position to last position, is like last position && last position (valid)' do
          expect(parser.marc_spec).to parse('...[#-#]/#', trace: true)
        end
        it 'range from last position to last position, is like last position && first position (valid)' do
          expect(parser.marc_spec).to parse('...[#-#]/0', trace: true)
        end
        it 'range from last position to last position, is like last position && position ten (valid)' do
          expect(parser.marc_spec).to parse('...[#-#]/9', trace: true)
        end
        it 'range from last position to last position, is like last position && position eleven (valid)' do
          expect(parser.marc_spec).to parse('...[#-#]/10', trace: true)
        end
        it 'range from last position to last position, is like last position && position 101 (valid)' do
          expect(parser.marc_spec).to parse('...[#-#]/100', trace: true)
        end
        it 'range from last position to last position, is like last position && range from first position to second (valid)' do
          expect(parser.marc_spec).to parse('...[#-#]/0-1', trace: true)
        end
        it 'range from last position to last position, is like last position && range from first position to last (valid)' do
          expect(parser.marc_spec).to parse('...[#-#]/0-#', trace: true)
        end
        it 'range from last position to last position, is like last position && range from first position to first position, is like first position (valid)' do
          expect(parser.marc_spec).to parse('...[#-#]/0-0', trace: true)
        end
        it 'range from last position to last position, is like last position && range from last position to last position, is like last position (valid)' do
          expect(parser.marc_spec).to parse('...[#-#]/#-#', trace: true)
        end
        it 'range from last position to last position, is like last position && range from last position to position one (index reverted), is like last position (valid)' do
          expect(parser.marc_spec).to parse('...[#-#]/#-0', trace: true)
        end
        it 'range from last position to last position, is like last position && range from last position to position two (index reverted) (valid)' do
          expect(parser.marc_spec).to parse('...[#-#]/#-1', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && last position (valid)' do
          expect(parser.marc_spec).to parse('...[#-0]/#', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && first position (valid)' do
          expect(parser.marc_spec).to parse('...[#-0]/0', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && position ten (valid)' do
          expect(parser.marc_spec).to parse('...[#-0]/9', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && position eleven (valid)' do
          expect(parser.marc_spec).to parse('...[#-0]/10', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && position 101 (valid)' do
          expect(parser.marc_spec).to parse('...[#-0]/100', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && range from first position to second (valid)' do
          expect(parser.marc_spec).to parse('...[#-0]/0-1', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && range from first position to last (valid)' do
          expect(parser.marc_spec).to parse('...[#-0]/0-#', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && range from first position to first position, is like first position (valid)' do
          expect(parser.marc_spec).to parse('...[#-0]/0-0', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && range from last position to last position, is like last position (valid)' do
          expect(parser.marc_spec).to parse('...[#-0]/#-#', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && range from last position to position one (index reverted), is like last position (valid)' do
          expect(parser.marc_spec).to parse('...[#-0]/#-0', trace: true)
        end
        it 'range from last position to position one (index reverted), is like last position && range from last position to position two (index reverted) (valid)' do
          expect(parser.marc_spec).to parse('...[#-0]/#-1', trace: true)
        end
        it 'range from last position to position two (index reverted) && last position (valid)' do
          expect(parser.marc_spec).to parse('...[#-1]/#', trace: true)
        end
        it 'range from last position to position two (index reverted) && first position (valid)' do
          expect(parser.marc_spec).to parse('...[#-1]/0', trace: true)
        end
        it 'range from last position to position two (index reverted) && position ten (valid)' do
          expect(parser.marc_spec).to parse('...[#-1]/9', trace: true)
        end
        it 'range from last position to position two (index reverted) && position eleven (valid)' do
          expect(parser.marc_spec).to parse('...[#-1]/10', trace: true)
        end
        it 'range from last position to position two (index reverted) && position 101 (valid)' do
          expect(parser.marc_spec).to parse('...[#-1]/100', trace: true)
        end
        it 'range from last position to position two (index reverted) && range from first position to second (valid)' do
          expect(parser.marc_spec).to parse('...[#-1]/0-1', trace: true)
        end
        it 'range from last position to position two (index reverted) && range from first position to last (valid)' do
          expect(parser.marc_spec).to parse('...[#-1]/0-#', trace: true)
        end
        it 'range from last position to position two (index reverted) && range from first position to first position, is like first position (valid)' do
          expect(parser.marc_spec).to parse('...[#-1]/0-0', trace: true)
        end
        it 'range from last position to position two (index reverted) && range from last position to last position, is like last position (valid)' do
          expect(parser.marc_spec).to parse('...[#-1]/#-#', trace: true)
        end
        it 'range from last position to position two (index reverted) && range from last position to position one (index reverted), is like last position (valid)' do
          expect(parser.marc_spec).to parse('...[#-1]/#-0', trace: true)
        end
        it 'range from last position to position two (index reverted) && range from last position to position two (index reverted) (valid)' do
          expect(parser.marc_spec).to parse('...[#-1]/#-1', trace: true)
        end
      end
    end
  end
end
