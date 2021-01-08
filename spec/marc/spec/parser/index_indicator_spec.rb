require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve
module MARC
  module Spec
    describe Parser do
      let(:parser) { Parser.new }

      describe index_indicator do
        describe 'wild combination of valid field tag, index and indicators' do
          it 'last position && indicator 1' do
            expect(parser.marc_spec).to parse('...[#]^1', trace: true)
          end

          it 'last position && indicator 2' do
            expect(parser.marc_spec).to parse('...[#]^2', trace: true)
          end

          it 'first position && indicator 1' do
            expect(parser.marc_spec).to parse('...[0]^1', trace: true)
          end

          it 'first position && indicator 2' do
            expect(parser.marc_spec).to parse('...[0]^2', trace: true)
          end

          it 'position ten && indicator 1' do
            expect(parser.marc_spec).to parse('...[9]^1', trace: true)
          end

          it 'position ten && indicator 2' do
            expect(parser.marc_spec).to parse('...[9]^2', trace: true)
          end

          it 'position eleven && indicator 1' do
            expect(parser.marc_spec).to parse('...[10]^1', trace: true)
          end

          it 'position eleven && indicator 2' do
            expect(parser.marc_spec).to parse('...[10]^2', trace: true)
          end

          it 'position 101 && indicator 1' do
            expect(parser.marc_spec).to parse('...[100]^1', trace: true)
          end

          it 'position 101 && indicator 2' do
            expect(parser.marc_spec).to parse('...[100]^2', trace: true)
          end

          it 'range from first position to second && indicator 1' do
            expect(parser.marc_spec).to parse('...[0-1]^1', trace: true)
          end

          it 'range from first position to second && indicator 2' do
            expect(parser.marc_spec).to parse('...[0-1]^2', trace: true)
          end

          it 'range from first position to last && indicator 1' do
            expect(parser.marc_spec).to parse('...[0-#]^1', trace: true)
          end

          it 'range from first position to last && indicator 2' do
            expect(parser.marc_spec).to parse('...[0-#]^2', trace: true)
          end

          it 'range from first position to first position, is like first position && indicator 1' do
            expect(parser.marc_spec).to parse('...[0-0]^1', trace: true)
          end

          it 'range from first position to first position, is like first position && indicator 2' do
            expect(parser.marc_spec).to parse('...[0-0]^2', trace: true)
          end

          it 'range from last position to last position, is like last position && indicator 1' do
            expect(parser.marc_spec).to parse('...[#-#]^1', trace: true)
          end

          it 'range from last position to last position, is like last position && indicator 2' do
            expect(parser.marc_spec).to parse('...[#-#]^2', trace: true)
          end

          it 'range from last position to position one (index reverted), is like last position && indicator 1' do
            expect(parser.marc_spec).to parse('...[#-0]^1', trace: true)
          end

          it 'range from last position to position one (index reverted), is like last position && indicator 2' do
            expect(parser.marc_spec).to parse('...[#-0]^2', trace: true)
          end

          it 'range from last position to position two (index reverted) && indicator 1' do
            expect(parser.marc_spec).to parse('...[#-1]^1', trace: true)
          end

          it 'range from last position to position two (index reverted) && indicator 2' do
            expect(parser.marc_spec).to parse('...[#-1]^2', trace: true)
          end
        end
      end
    end
  end
end
