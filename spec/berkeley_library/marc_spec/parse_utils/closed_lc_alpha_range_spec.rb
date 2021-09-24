require 'spec_helper'
require 'parslet/rig/rspec'

module BerkeleyLibrary
  module MarcSpec
    module ParseUtils
      describe ClosedLcAlphaRange do
        attr_reader :range

        before(:each) do
          @range = ClosedLcAlphaRange.new
        end

        it 'parses a valid range' do
          valid_ranges = %w[
            a-b
            c-d
            e-f
            g-z
          ]
          aggregate_failures 'valid ranges' do
            valid_ranges.each do |r|
              expect(range).to parse(r)
            end
          end
        end

        it 'does not parse an invalid range' do
          invalid_ranges = %w[
            z-a
            b-a
            d-c
            x-f
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
            expect(range.to_s(prec)).to eq('ClosedLcAlphaRange')
          end
        end
      end
    end
  end
end
