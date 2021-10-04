require 'spec_helper'

module BerkeleyLibrary
  module MarcSpec
    module Query
      describe VarFieldValue do
        it 'accepts a tag and subfield' do
          tag = Tag.new('856')
          sf = Subfield.new(code: 'u')
          v = VarFieldValue.new(tag, sf)
          expect(v.tag).to eq(tag)
          expect(v.subfield).to eq(sf)
          expect(v.to_s).to eq('856$u')
        end
      end
    end
  end
end
