require 'spec_helper'
require 'parslet/rig/rspec'

module MARC
  module Spec
    describe Parser do
      let(:parser) { Parser.new }

      it 'is a parser' do
        expect(parser).to be_a(Parslet::Parser)
      end

      describe :range do
        it 'parses a valid range' do
          result = parser.range.parse('0-1')
          expect(result).to be_a(Hash)
          r_start, r_end = result[:start], result[:end]
          [r_start, r_end].each { |r| expect(r).to be_a(Parslet::Slice) }
          expect(r_start).to eq('0')
          expect(r_end).to eq('1')
          expect(r_start.position.charpos).to eq(0)
          expect(r_end.position.charpos).to eq(2)
        end

        it 'parses a forward open range' do
          result = parser.range.parse('11-#')
          r_start, r_end = result[:start], result[:end]
          expect(r_start).to eq('11')
          expect(r_end).to be_nil
        end

        it 'parses a reverse open range' do
          result = parser.range.parse('#-11')
          r_start, r_end = result[:start], result[:end]
          expect(r_start).to be_nil
          expect(r_end).to eq('11')
        end
      end
    end
  end
end
