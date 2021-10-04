require 'spec_helper'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      describe Tag do
        it 'accepts a plain tag' do
          tag = Tag.new('856')
          expect(tag.tag_exact).to eq('856')
          expect(tag.tag_re).to be_nil
          expect(tag.to_s).to eq('856')
          expect(tag.inspect).to match(/Tag@[0-9]+<856>/)
        end

        it 'accepts a wildcard' do
          tag = Tag.new('.56')
          expect(tag.tag_exact).to be_nil
          expect(tag.tag_re).to eq(/.56/)
          expect(tag.to_s).to eq('.56')
          expect(tag.inspect).to match %r{Tag@[0-9]+</.56/>}
        end

        it 'accepts a regexp' do
          tag = Tag.new(/.56/)
          expect(tag.tag_exact).to be_nil
          expect(tag.tag_re).to eq(/.56/)
          expect(tag.to_s).to eq('.56')
          expect(tag.inspect).to match %r{Tag@[0-9]+</.56/>}
        end
      end
    end
  end
end
