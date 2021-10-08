require 'spec_helper'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      describe FixedFieldValue do
        it 'accepts a position' do
          tag = Tag.new('001')
          pos = Position.new(3)
          v = FixedFieldValue.new(tag, pos)
          expect(v.tag).to eq(tag)
          expect(v.character_spec).to eq(pos)
          expect(v.to_s).to eq('001/3')
        end

        it 'accepts a range' do
          tag = Tag.new('001')
          range = AlNumRange.new(3, 5)
          v = FixedFieldValue.new(tag, range)
          expect(v.tag).to eq(tag)
          expect(v.character_spec).to eq(range)
          expect(v.to_s).to eq('001/3-5')
        end

        it 'rejects a nil tag' do
          pos = Position.new(3)
          expect { FixedFieldValue.new(nil, pos) }.to raise_error(ArgumentError)
        end

        it 'rejects an invalid tag' do
          pos = Position.new(3)
          expect { FixedFieldValue.new('856', pos) }.to raise_error(ArgumentError)
        end

        it 'rejects an invalid characterspec' do
          tag = Tag.new('001')
          expect { FixedFieldValue.new(tag, /([a-z]+)/) }.to raise_error(ArgumentError)
        end
      end
    end
  end
end
