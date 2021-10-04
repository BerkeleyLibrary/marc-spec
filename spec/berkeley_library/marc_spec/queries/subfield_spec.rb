require 'spec_helper'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      describe Subfield do
        it 'accepts a plain code' do
          sf = Subfield.new('u')
          expect(sf.code).to eq('u')
          expect(sf.to_s).to eq('$u')
        end

        it 'accepts a numeric code range' do
          code_range = AlNumRange.new(3, 5)
          sf = Subfield.new(code_range)
          expect(sf.code).to eq(code_range)
          expect(sf.to_s).to eq('$3-5')
        end

        it 'accepts an alphabetic code range' do
          code_range = AlNumRange.new('k', 'q')
          sf = Subfield.new(code_range)
          expect(sf.code).to eq(code_range)
          expect(sf.to_s).to eq('$k-q')
        end
      end
    end
  end
end
