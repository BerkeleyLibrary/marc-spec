require 'spec_helper'

module BerkeleyLibrary
  module MarcSpec
    module Query
      describe IndicatorValue do
        it 'accepts an int indicator' do
          tag = Tag.new('856')
          v = IndicatorValue.new(tag, 1)
          expect(v.tag).to eq(tag)
          expect(v.ind).to eq(1)
          expect(v.to_s).to eq('856^1')
        end

        it 'accepts a string indicator' do
          tag = Tag.new('856')
          v = IndicatorValue.new(tag, '1')
          expect(v.tag).to eq(tag)
          expect(v.ind).to eq(1)
          expect(v.to_s).to eq('856^1')
        end

        it 'rejects a nil indicator' do
          tag = Tag.new('856')
          expect { IndicatorValue.new(tag, nil) }.to raise_error(ArgumentError)
        end

        it 'rejects an invalid indicator' do
          tag = Tag.new('856')
          expect { IndicatorValue.new(tag, 3) }.to raise_error(ArgumentError)
          expect { IndicatorValue.new(tag, '3') }.to raise_error(ArgumentError)
        end
      end
    end
  end
end
