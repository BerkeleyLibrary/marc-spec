require 'spec_helper'
require 'parslet/rig/rspec'

module BerkeleyLibrary
  module MarcSpec
    module ParseUtils
      describe ClosedRange do
        attr_reader :closed_range

        before(:each) do
          @closed_range = ClosedRange.new
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
              expect(closed_range).to parse(r)
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
              expect(closed_range).not_to parse(r)
            end
          end
        end

        describe :to_s do
          it 'accepts a precedece argument' do
            prec = Parslet::Atoms::Precedence::OUTER
            expect(closed_range.to_s(prec)).to eq('ClosedRange')
          end
        end
      end
    end
  end
end
