require 'spec_helper'

module MARC::Spec
  module Queries
    describe CharacterSpec do
      it 'accepts a position' do
        pos = Position.new(3)
        # noinspection RubyArgCount
        v = CharacterSpec.new(pos)
        expect(v.character_spec).to eq(pos)
        expect(v.to_s).to eq('/3')
      end

      it 'accepts a range' do
        range = AlNumRange.new(3, 5)
        # noinspection RubyArgCount
        v = CharacterSpec.new(range)
        expect(v.character_spec).to eq(range)
        expect(v.to_s).to eq('/3-5')
      end

      it 'rejects an invalid characterspec' do
        # noinspection RubyArgCount
        expect { CharacterSpec.new(/([a-z]+)/) }.to raise_error(ArgumentError)
      end
    end
  end
end
