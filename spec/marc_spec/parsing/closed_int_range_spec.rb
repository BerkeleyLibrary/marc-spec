require 'spec_helper'
require 'parslet/rig/rspec'

module MarcSpec
  module Parsing
    describe ClosedIntRange do
      attr_reader :range

      before(:each) do
        @range = ClosedIntRange.new
      end

      it 'parses a valid range' do
        valid_ranges = %w[
          0-1
          1-2
          12-345
          67890-123456
        ]
        aggregate_failures 'valid ranges' do
          valid_ranges.each do |r|
            expect(range).to parse(r)
          end
        end
      end

      it 'does not parse an invalid range' do
        invalid_ranges = %w[
          1-0
          2-1
          345-12
          123456-67890
        ]
        aggregate_failures 'invalid ranges' do
          invalid_ranges.each do |r|
            expect(range).not_to parse(r)
          end
        end
      end

      describe :to_s do
        it 'accepts a precedece argument' do
          prec = Parslet::Atoms::Precedence::OUTER
          expect(range.to_s(prec)).to eq('ClosedIntRange')
        end
      end
    end
  end
end
