require 'spec_helper'
require 'parslet/rig/rspec'

module BerkeleyLibrary
  module MarcSpec
    module Parsing
      context 'suite' do
        describe :index_indicator do
          let(:parser) { Parser.new }
          let(:reporter) { Parslet::ErrorReporter::Deepest.new }

          describe 'marc_spec: valid field tag, index and indicators' do
            # /valid/wildCombination_validIndexIndicator.json

            describe 'last position' do

              it '&& indicator 1 -> valid' do
                # /valid/wildCombination_validIndexIndicator.json
                expect(parser.marc_spec).to parse('...[#]^1', trace: true, reporter: reporter)
              end

              it '&& indicator 2 -> valid' do
                # /valid/wildCombination_validIndexIndicator.json
                expect(parser.marc_spec).to parse('...[#]^2', trace: true, reporter: reporter)
              end

            end

            describe 'first position' do

              it '&& indicator 1 -> valid' do
                # /valid/wildCombination_validIndexIndicator.json
                expect(parser.marc_spec).to parse('...[0]^1', trace: true, reporter: reporter)
              end

              it '&& indicator 2 -> valid' do
                # /valid/wildCombination_validIndexIndicator.json
                expect(parser.marc_spec).to parse('...[0]^2', trace: true, reporter: reporter)
              end

            end

            describe 'position ten' do

              it '&& indicator 1 -> valid' do
                # /valid/wildCombination_validIndexIndicator.json
                expect(parser.marc_spec).to parse('...[9]^1', trace: true, reporter: reporter)
              end

              it '&& indicator 2 -> valid' do
                # /valid/wildCombination_validIndexIndicator.json
                expect(parser.marc_spec).to parse('...[9]^2', trace: true, reporter: reporter)
              end

            end

            describe 'position eleven' do

              it '&& indicator 1 -> valid' do
                # /valid/wildCombination_validIndexIndicator.json
                expect(parser.marc_spec).to parse('...[10]^1', trace: true, reporter: reporter)
              end

              it '&& indicator 2 -> valid' do
                # /valid/wildCombination_validIndexIndicator.json
                expect(parser.marc_spec).to parse('...[10]^2', trace: true, reporter: reporter)
              end

            end

            describe 'position 101' do

              it '&& indicator 1 -> valid' do
                # /valid/wildCombination_validIndexIndicator.json
                expect(parser.marc_spec).to parse('...[100]^1', trace: true, reporter: reporter)
              end

              it '&& indicator 2 -> valid' do
                # /valid/wildCombination_validIndexIndicator.json
                expect(parser.marc_spec).to parse('...[100]^2', trace: true, reporter: reporter)
              end

            end

            describe 'range from first position to second' do

              it '&& indicator 1 -> valid' do
                # /valid/wildCombination_validIndexIndicator.json
                expect(parser.marc_spec).to parse('...[0-1]^1', trace: true, reporter: reporter)
              end

              it '&& indicator 2 -> valid' do
                # /valid/wildCombination_validIndexIndicator.json
                expect(parser.marc_spec).to parse('...[0-1]^2', trace: true, reporter: reporter)
              end

            end

            describe 'range from first position to last' do

              it '&& indicator 1 -> valid' do
                # /valid/wildCombination_validIndexIndicator.json
                expect(parser.marc_spec).to parse('...[0-#]^1', trace: true, reporter: reporter)
              end

              it '&& indicator 2 -> valid' do
                # /valid/wildCombination_validIndexIndicator.json
                expect(parser.marc_spec).to parse('...[0-#]^2', trace: true, reporter: reporter)
              end

            end

            describe 'range from first position to first position, is like first position' do

              it '&& indicator 1 -> valid' do
                # /valid/wildCombination_validIndexIndicator.json
                expect(parser.marc_spec).to parse('...[0-0]^1', trace: true, reporter: reporter)
              end

              it '&& indicator 2 -> valid' do
                # /valid/wildCombination_validIndexIndicator.json
                expect(parser.marc_spec).to parse('...[0-0]^2', trace: true, reporter: reporter)
              end

            end

            describe 'range from last position to last position, is like last position' do

              it '&& indicator 1 -> valid' do
                # /valid/wildCombination_validIndexIndicator.json
                expect(parser.marc_spec).to parse('...[#-#]^1', trace: true, reporter: reporter)
              end

              it '&& indicator 2 -> valid' do
                # /valid/wildCombination_validIndexIndicator.json
                expect(parser.marc_spec).to parse('...[#-#]^2', trace: true, reporter: reporter)
              end

            end

            describe 'range from last position to position one (index reverted), is like last position' do

              it '&& indicator 1 -> valid' do
                # /valid/wildCombination_validIndexIndicator.json
                expect(parser.marc_spec).to parse('...[#-0]^1', trace: true, reporter: reporter)
              end

              it '&& indicator 2 -> valid' do
                # /valid/wildCombination_validIndexIndicator.json
                expect(parser.marc_spec).to parse('...[#-0]^2', trace: true, reporter: reporter)
              end

            end

            describe 'range from last position to position two (index reverted)' do

              it '&& indicator 1 -> valid' do
                # /valid/wildCombination_validIndexIndicator.json
                expect(parser.marc_spec).to parse('...[#-1]^1', trace: true, reporter: reporter)
              end

              it '&& indicator 2 -> valid' do
                # /valid/wildCombination_validIndexIndicator.json
                expect(parser.marc_spec).to parse('...[#-1]^2', trace: true, reporter: reporter)
              end

            end

          end
        end
      end
    end
  end
end
