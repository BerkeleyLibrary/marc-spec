require 'spec_helper'

module MARC::Spec
  module Queries
    describe AlNumRange do
      describe 'closed, alphabetical' do
        it 'handles string arguments' do
          r = AlNumRange.new('j', 'q')
          expect(r.from).to eq('j')
          expect(r.to).to eq('q')
          expect(r.to_s).to eq('j-q')

          %w[j m q].each { |i| expect(r).to include(i) }
          %w[i r].each { |i| expect(r).not_to include(i) }

          expect(r.select_from('nequaquam vacuum')).to eq('nqqmm')
        end

        it 'handles Parslet::Slice arguments' do
          r = AlNumRange.new(
            Parslet::Slice.new(1, 'j'),
            Parslet::Slice.new(3, 'q')
          )
          expect(r.from).to eq('j')
          expect(r.to).to eq('q')
          expect(r.to_s).to eq('j-q')

          %w[j m q].each { |i| expect(r).to include(i) }
          %w[i r].each { |i| expect(r).not_to include(i) }

          expect(r.select_from('nequaquam vacuum')).to eq('nqqmm')
        end
      end

      describe 'closed, numeric' do
        it 'handles int arguments' do
          r = AlNumRange.new(3, 5)
          expect(r.from).to eq(3)
          expect(r.to).to eq(5)
          expect(r.to_s).to eq('3-5')

          [3, 4, 5].each { |i| expect(r).to include(i) }
          [2, 6].each { |i| expect(r).not_to include(i) }

          expect(r.select_from([3, 1, 4, 1, 5, 9, 2, 6, 5])).to eq([1, 5, 9])
        end

        it 'handles string arguments' do
          r = AlNumRange.new('3', '5')
          expect(r.from).to eq(3)
          expect(r.to).to eq(5)
          expect(r.to_s).to eq('3-5')

          [3, 4, 5].each { |i| expect(r).to include(i) }
          [2, 6].each { |i| expect(r).not_to include(i) }

          expect(r.select_from([3, 1, 4, 1, 5, 9, 2, 6, 5])).to eq([1, 5, 9])
        end
      end

      describe 'left open, numeric' do
        it 'handles int arguments' do
          r = AlNumRange.new(nil, 5)
          expect(r.from).to be_nil
          expect(r.to).to eq(5)
          expect(r.to_s).to eq('#-5')

          [-5, -4, -3].each { |i| expect(r).to include(i) }
          [1, 2, -6, -7].each { |i| expect(r).not_to include(i) }

          expect(r.select_from([3, 1, 4, 1, 5, 9, 2, 6, 5])).to eq([1, 5, 9, 2, 6, 5])
        end

        it 'handles string arguments' do
          r = AlNumRange.new('#', '5')
          expect(r.from).to be_nil
          expect(r.to).to eq(5)
          expect(r.to_s).to eq('#-5')

          [-5, -4, -3].each { |i| expect(r).to include(i) }
          [1, 2, -6, -7].each { |i| expect(r).not_to include(i) }

          expect(r.select_from([3, 1, 4, 1, 5, 9, 2, 6, 5])).to eq([1, 5, 9, 2, 6, 5])
        end
      end

      describe 'right open, numeric' do
        it 'handles int arguments' do
          r = AlNumRange.new(4, nil)
          expect(r.from).to eq(4)
          expect(r.to).to be_nil
          expect(r.to_s).to eq('4-#')

          [4, 5].each { |i| expect(r).to include(i) }
          [1, 2].each { |i| expect(r).not_to include(i) }

          expect(r.select_from([3, 1, 4, 1, 5, 9, 2, 6, 5])).to eq([5, 9, 2, 6, 5])
        end

        it 'handles string arguments' do
          r = AlNumRange.new('4', '#')
          expect(r.from).to eq(4)
          expect(r.to).to be_nil
          expect(r.to_s).to eq('4-#')

          [4, 5].each { |i| expect(r).to include(i) }
          [1, 2].each { |i| expect(r).not_to include(i) }

          expect(r.select_from([3, 1, 4, 1, 5, 9, 2, 6, 5])).to eq([5, 9, 2, 6, 5])
        end
      end
    end
  end
end
