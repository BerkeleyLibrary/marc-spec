require 'spec_helper'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      describe IndicatorValue do
        it 'accepts an int indicator' do
          v = IndicatorValue.new(1)
          expect(v.ind).to eq(1)
          expect(v.to_s).to eq('^1')
        end

        it 'accepts a string indicator' do
          v = IndicatorValue.new('1')
          expect(v.ind).to eq(1)
          expect(v.to_s).to eq('^1')
        end

        it 'rejects a nil indicator' do
          expect { IndicatorValue.new(nil) }.to raise_error(ArgumentError)
        end

        it 'rejects an invalid indicator' do
          expect { IndicatorValue.new(3) }.to raise_error(ArgumentError)
          expect { IndicatorValue.new('3') }.to raise_error(ArgumentError)
        end
      end
    end
  end
end
