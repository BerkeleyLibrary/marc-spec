require 'spec_helper'

module MarcSpec
  module Queries
    describe SubfieldValue do
      describe :apply do
        attr_reader :marc_record
        attr_reader :df998

        before(:each) do
          @marc_record = MARC::XMLReader.new('spec/data/b23161018-sru.xml').first
          @df998 = marc_record['998']
        end

        it 'extracts substrings from values' do
          subfield = Subfield.new('g', index: AlNumRange.new(3, 5))
          # noinspection RubyArgCount
          subfield_value = SubfieldValue.new(subfield, CharacterSpec.new(AlNumRange.new(0, 9)))

          result = subfield_value.apply(df998)
          expect(result.size).to eq(3)

          all_sf998g = df998.subfields.select { |sf| sf.code == 'g' }
          selected = all_sf998g[3..5]
          expected = selected.map { |sf| sf.value[0..9] }
          expect(result).to eq(expected)
        end
      end
    end
  end
end
