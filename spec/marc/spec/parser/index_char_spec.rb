require 'spec_helper'
require 'parslet/rig/rspec'

module MARC
  module Spec
    describe :index_char do
      let(:parser) { Parser.new }
      let(:reporter) { Parslet::ErrorReporter::Deepest.new }

      describe 'valid field tag, index and charspec' do
        # /valid/wildCombination_validIndexChar.json

        describe 'last position' do

          it '&& first position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#]/0', trace: true, reporter: reporter)
          end

          it '&& last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#]/#', trace: true, reporter: reporter)
          end

          it '&& position 101 -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#]/100', trace: true, reporter: reporter)
          end

          it '&& position eleven -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#]/10', trace: true, reporter: reporter)
          end

          it '&& position ten -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#]/9', trace: true, reporter: reporter)
          end

          it '&& range from first position to first position, is like first position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#]/0-0', trace: true, reporter: reporter)
          end

          it '&& range from first position to last -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#]/0-#', trace: true, reporter: reporter)
          end

          it '&& range from first position to second -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#]/0-1', trace: true, reporter: reporter)
          end

          it '&& range from last position to last position, is like last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#]/#-#', trace: true, reporter: reporter)
          end

          it '&& range from last position to position one (index reverted), is like last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#]/#-0', trace: true, reporter: reporter)
          end

          it '&& range from last position to position two (index reverted) -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#]/#-1', trace: true, reporter: reporter)
          end

        end

        describe 'first position' do

          it '&& first position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0]/0', trace: true, reporter: reporter)
          end

          it '&& last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0]/#', trace: true, reporter: reporter)
          end

          it '&& position 101 -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0]/100', trace: true, reporter: reporter)
          end

          it '&& position eleven -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0]/10', trace: true, reporter: reporter)
          end

          it '&& position ten -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0]/9', trace: true, reporter: reporter)
          end

          it '&& range from first position to first position, is like first position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0]/0-0', trace: true, reporter: reporter)
          end

          it '&& range from first position to last -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0]/0-#', trace: true, reporter: reporter)
          end

          it '&& range from first position to second -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0]/0-1', trace: true, reporter: reporter)
          end

          it '&& range from last position to last position, is like last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0]/#-#', trace: true, reporter: reporter)
          end

          it '&& range from last position to position one (index reverted), is like last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0]/#-0', trace: true, reporter: reporter)
          end

          it '&& range from last position to position two (index reverted) -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0]/#-1', trace: true, reporter: reporter)
          end

        end

        describe 'position ten' do

          it '&& first position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[9]/0', trace: true, reporter: reporter)
          end

          it '&& last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[9]/#', trace: true, reporter: reporter)
          end

          it '&& position 101 -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[9]/100', trace: true, reporter: reporter)
          end

          it '&& position eleven -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[9]/10', trace: true, reporter: reporter)
          end

          it '&& position ten -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[9]/9', trace: true, reporter: reporter)
          end

          it '&& range from first position to first position, is like first position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[9]/0-0', trace: true, reporter: reporter)
          end

          it '&& range from first position to last -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[9]/0-#', trace: true, reporter: reporter)
          end

          it '&& range from first position to second -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[9]/0-1', trace: true, reporter: reporter)
          end

          it '&& range from last position to last position, is like last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[9]/#-#', trace: true, reporter: reporter)
          end

          it '&& range from last position to position one (index reverted), is like last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[9]/#-0', trace: true, reporter: reporter)
          end

          it '&& range from last position to position two (index reverted) -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[9]/#-1', trace: true, reporter: reporter)
          end

        end

        describe 'position eleven' do

          it '&& first position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[10]/0', trace: true, reporter: reporter)
          end

          it '&& last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[10]/#', trace: true, reporter: reporter)
          end

          it '&& position 101 -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[10]/100', trace: true, reporter: reporter)
          end

          it '&& position eleven -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[10]/10', trace: true, reporter: reporter)
          end

          it '&& position ten -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[10]/9', trace: true, reporter: reporter)
          end

          it '&& range from first position to first position, is like first position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[10]/0-0', trace: true, reporter: reporter)
          end

          it '&& range from first position to last -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[10]/0-#', trace: true, reporter: reporter)
          end

          it '&& range from first position to second -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[10]/0-1', trace: true, reporter: reporter)
          end

          it '&& range from last position to last position, is like last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[10]/#-#', trace: true, reporter: reporter)
          end

          it '&& range from last position to position one (index reverted), is like last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[10]/#-0', trace: true, reporter: reporter)
          end

          it '&& range from last position to position two (index reverted) -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[10]/#-1', trace: true, reporter: reporter)
          end

        end

        describe 'position 101' do

          it '&& first position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[100]/0', trace: true, reporter: reporter)
          end

          it '&& last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[100]/#', trace: true, reporter: reporter)
          end

          it '&& position 101 -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[100]/100', trace: true, reporter: reporter)
          end

          it '&& position eleven -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[100]/10', trace: true, reporter: reporter)
          end

          it '&& position ten -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[100]/9', trace: true, reporter: reporter)
          end

          it '&& range from first position to first position, is like first position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[100]/0-0', trace: true, reporter: reporter)
          end

          it '&& range from first position to last -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[100]/0-#', trace: true, reporter: reporter)
          end

          it '&& range from first position to second -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[100]/0-1', trace: true, reporter: reporter)
          end

          it '&& range from last position to last position, is like last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[100]/#-#', trace: true, reporter: reporter)
          end

          it '&& range from last position to position one (index reverted), is like last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[100]/#-0', trace: true, reporter: reporter)
          end

          it '&& range from last position to position two (index reverted) -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[100]/#-1', trace: true, reporter: reporter)
          end

        end

        describe 'range from first position to second' do

          it '&& first position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-1]/0', trace: true, reporter: reporter)
          end

          it '&& last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-1]/#', trace: true, reporter: reporter)
          end

          it '&& position 101 -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-1]/100', trace: true, reporter: reporter)
          end

          it '&& position eleven -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-1]/10', trace: true, reporter: reporter)
          end

          it '&& position ten -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-1]/9', trace: true, reporter: reporter)
          end

          it '&& range from first position to first position, is like first position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-1]/0-0', trace: true, reporter: reporter)
          end

          it '&& range from first position to last -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-1]/0-#', trace: true, reporter: reporter)
          end

          it '&& range from first position to second -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-1]/0-1', trace: true, reporter: reporter)
          end

          it '&& range from last position to last position, is like last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-1]/#-#', trace: true, reporter: reporter)
          end

          it '&& range from last position to position one (index reverted), is like last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-1]/#-0', trace: true, reporter: reporter)
          end

          it '&& range from last position to position two (index reverted) -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-1]/#-1', trace: true, reporter: reporter)
          end

        end

        describe 'range from first position to last' do

          it '&& first position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-#]/0', trace: true, reporter: reporter)
          end

          it '&& last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-#]/#', trace: true, reporter: reporter)
          end

          it '&& position 101 -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-#]/100', trace: true, reporter: reporter)
          end

          it '&& position eleven -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-#]/10', trace: true, reporter: reporter)
          end

          it '&& position ten -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-#]/9', trace: true, reporter: reporter)
          end

          it '&& range from first position to first position, is like first position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-#]/0-0', trace: true, reporter: reporter)
          end

          it '&& range from first position to last -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-#]/0-#', trace: true, reporter: reporter)
          end

          it '&& range from first position to second -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-#]/0-1', trace: true, reporter: reporter)
          end

          it '&& range from last position to last position, is like last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-#]/#-#', trace: true, reporter: reporter)
          end

          it '&& range from last position to position one (index reverted), is like last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-#]/#-0', trace: true, reporter: reporter)
          end

          it '&& range from last position to position two (index reverted) -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-#]/#-1', trace: true, reporter: reporter)
          end

        end

        describe 'range from first position to first position, is like first position' do

          it '&& first position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-0]/0', trace: true, reporter: reporter)
          end

          it '&& last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-0]/#', trace: true, reporter: reporter)
          end

          it '&& position 101 -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-0]/100', trace: true, reporter: reporter)
          end

          it '&& position eleven -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-0]/10', trace: true, reporter: reporter)
          end

          it '&& position ten -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-0]/9', trace: true, reporter: reporter)
          end

          it '&& range from first position to first position, is like first position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-0]/0-0', trace: true, reporter: reporter)
          end

          it '&& range from first position to last -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-0]/0-#', trace: true, reporter: reporter)
          end

          it '&& range from first position to second -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-0]/0-1', trace: true, reporter: reporter)
          end

          it '&& range from last position to last position, is like last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-0]/#-#', trace: true, reporter: reporter)
          end

          it '&& range from last position to position one (index reverted), is like last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-0]/#-0', trace: true, reporter: reporter)
          end

          it '&& range from last position to position two (index reverted) -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[0-0]/#-1', trace: true, reporter: reporter)
          end

        end

        describe 'range from last position to last position, is like last position' do

          it '&& first position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-#]/0', trace: true, reporter: reporter)
          end

          it '&& last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-#]/#', trace: true, reporter: reporter)
          end

          it '&& position 101 -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-#]/100', trace: true, reporter: reporter)
          end

          it '&& position eleven -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-#]/10', trace: true, reporter: reporter)
          end

          it '&& position ten -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-#]/9', trace: true, reporter: reporter)
          end

          it '&& range from first position to first position, is like first position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-#]/0-0', trace: true, reporter: reporter)
          end

          it '&& range from first position to last -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-#]/0-#', trace: true, reporter: reporter)
          end

          it '&& range from first position to second -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-#]/0-1', trace: true, reporter: reporter)
          end

          it '&& range from last position to last position, is like last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-#]/#-#', trace: true, reporter: reporter)
          end

          it '&& range from last position to position one (index reverted), is like last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-#]/#-0', trace: true, reporter: reporter)
          end

          it '&& range from last position to position two (index reverted) -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-#]/#-1', trace: true, reporter: reporter)
          end

        end

        describe 'range from last position to position one (index reverted), is like last position' do

          it '&& first position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-0]/0', trace: true, reporter: reporter)
          end

          it '&& last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-0]/#', trace: true, reporter: reporter)
          end

          it '&& position 101 -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-0]/100', trace: true, reporter: reporter)
          end

          it '&& position eleven -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-0]/10', trace: true, reporter: reporter)
          end

          it '&& position ten -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-0]/9', trace: true, reporter: reporter)
          end

          it '&& range from first position to first position, is like first position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-0]/0-0', trace: true, reporter: reporter)
          end

          it '&& range from first position to last -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-0]/0-#', trace: true, reporter: reporter)
          end

          it '&& range from first position to second -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-0]/0-1', trace: true, reporter: reporter)
          end

          it '&& range from last position to last position, is like last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-0]/#-#', trace: true, reporter: reporter)
          end

          it '&& range from last position to position one (index reverted), is like last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-0]/#-0', trace: true, reporter: reporter)
          end

          it '&& range from last position to position two (index reverted) -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-0]/#-1', trace: true, reporter: reporter)
          end

        end

        describe 'range from last position to position two (index reverted)' do

          it '&& first position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-1]/0', trace: true, reporter: reporter)
          end

          it '&& last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-1]/#', trace: true, reporter: reporter)
          end

          it '&& position 101 -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-1]/100', trace: true, reporter: reporter)
          end

          it '&& position eleven -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-1]/10', trace: true, reporter: reporter)
          end

          it '&& position ten -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-1]/9', trace: true, reporter: reporter)
          end

          it '&& range from first position to first position, is like first position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-1]/0-0', trace: true, reporter: reporter)
          end

          it '&& range from first position to last -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-1]/0-#', trace: true, reporter: reporter)
          end

          it '&& range from first position to second -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-1]/0-1', trace: true, reporter: reporter)
          end

          it '&& range from last position to last position, is like last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-1]/#-#', trace: true, reporter: reporter)
          end

          it '&& range from last position to position one (index reverted), is like last position -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-1]/#-0', trace: true, reporter: reporter)
          end

          it '&& range from last position to position two (index reverted) -> valid' do
            # /valid/wildCombination_validIndexChar.json
            expect(parser.marc_spec).to parse('...[#-1]/#-1', trace: true, reporter: reporter)
          end

        end

      end
    end
  end
end
