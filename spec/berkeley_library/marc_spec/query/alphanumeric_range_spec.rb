require 'spec_helper'

module BerkeleyLibrary
  module MarcSpec
    module Query
      describe AlphanumericRange do
        describe 'closed, alphabetical' do
          it 'handles string arguments' do
            r = AlphanumericRange.new('j', 'q')
            expect(r.from).to eq('j')
            expect(r.to).to eq('q')
            expect(r.to_s).to eq('j-q')
          end

          it 'handles Parslet::Slice arguments' do
            r = AlphanumericRange.new(
              Parslet::Slice.new(1, 'j'),
              Parslet::Slice.new(3, 'q')
            )
            expect(r.from).to eq('j')
            expect(r.to).to eq('q')
            expect(r.to_s).to eq('j-q')
          end
        end

        describe 'closed, numeric' do
          it 'handles int arguments' do
            r = AlphanumericRange.new(3, 5)
            expect(r.from).to eq(3)
            expect(r.to).to eq(5)
            expect(r.to_s).to eq('3-5')
          end

          it 'handles string arguments' do
            r = AlphanumericRange.new('3', '5')
            expect(r.from).to eq(3)
            expect(r.to).to eq(5)
            expect(r.to_s).to eq('3-5')
          end
        end

        describe 'left open, numeric' do
          it 'handles int arguments' do
            r = AlphanumericRange.new(nil, 5)
            expect(r.from).to be_nil
            expect(r.to).to eq(5)
            expect(r.to_s).to eq('#-5')
          end

          it 'handles string arguments' do
            r = AlphanumericRange.new('#', '5')
            expect(r.from).to be_nil
            expect(r.to).to eq(5)
            expect(r.to_s).to eq('#-5')
          end
        end

        describe 'right open, numeric' do
          it 'handles int arguments' do
            r = AlphanumericRange.new(3, nil)
            expect(r.from).to eq(3)
            expect(r.to).to be_nil
            expect(r.to_s).to eq('3-#')
          end

          it 'handles string arguments' do
            r = AlphanumericRange.new('3', '#')
            expect(r.from).to eq(3)
            expect(r.to).to be_nil
            expect(r.to_s).to eq('3-#')
          end
        end
      end
    end
  end
end
