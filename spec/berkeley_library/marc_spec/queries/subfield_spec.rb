require 'spec_helper'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      describe Subfield do
        describe :new do
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

      describe :apply do
        attr_reader :marc_record

        describe 'non-repeated subfields' do
          before(:each) do
            @marc_record = MARC::XMLReader.new('spec/data/sandburg.xml').first
          end

          it 'finds a subfield' do
            df245 = marc_record['245']
            result = Subfield.new('a').apply(df245)
            expect(result).to be_an(Array)
            expect(result.size).to eq(1)

            sf245a = result.first
            expect(sf245a).to be_a(MARC::Subfield)

            expected = df245.subfields.find { |sf| sf.code == 'a' }
            expect(sf245a).to eq(expected)
          end

          it 'finds a range of subfields' do
            df260 = marc_record['260']
            range = AlNumRange.new('b', 'c')
            result = Subfield.new(range).apply(df260)
            expect(result).to be_an(Array)
            expect(result.size).to eq(2)

            expected = df260.subfields.select { |sf| %w[b c].include?(sf.code) }
            expect(result).to eq(expected)
          end

        end

        describe 'repeated subfields' do
          attr_reader :df998

          before(:each) do
            @marc_record = MARC::XMLReader.new('spec/data/b23161018-sru.xml').first
            @df998 = marc_record['998']
          end

          it 'finds repeated subfields' do
            result = Subfield.new('g').apply(df998)
            expect(result.size).to eq(20)

            expected = df998.subfields.select { |sf| sf.code == 'g' }
            expect(result).to eq(expected)
          end

          it 'finds repeated subfields by index' do
            marc_record = MARC::XMLReader.new('spec/data/b23161018-sru.xml').first
            df998 = marc_record['998']
            result = Subfield.new('g', index: AlNumRange.new(3, 5)).apply(df998)
            expect(result.size).to eq(3)

            all_sf998g = df998.subfields.select { |sf| sf.code == 'g' }
            expected = all_sf998g[3..5]
            expect(result).to eq(expected)
          end
        end
      end
    end
  end
end
