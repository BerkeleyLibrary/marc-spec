require 'spec_helper'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      describe CharacterSpec do
        it 'accepts a position' do
          pos = Position.new(3)
          v = CharacterSpec.new(pos)
          expect(v.character_spec).to eq(pos)
          expect(v.to_s).to eq('/3')
        end

        it 'accepts a range' do
          range = AlNumRange.new(3, 5)
          v = CharacterSpec.new(range)
          expect(v.character_spec).to eq(range)
          expect(v.to_s).to eq('/3-5')
        end

        it 'rejects an invalid characterspec' do
          expect { CharacterSpec.new(/([a-z]+)/) }.to raise_error(ArgumentError)
        end
      end
    end
  end
end
