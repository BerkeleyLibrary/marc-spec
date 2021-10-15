require 'spec_helper'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      describe Tag do
        describe :new do
          it 'accepts a plain tag' do
            tag = Tag.new('856')
            expect(tag.tag_exact).to eq('856')
            expect(tag.tag_re).to be_nil
            expect(tag.to_s).to eq('856')
            expect(tag.inspect).to eq('Tag<856>')
          end

          it 'accepts a wildcard' do
            tag = Tag.new('.56')
            expect(tag.tag_exact).to be_nil
            expect(tag.tag_re).to eq(/^.56$/)
            expect(tag.to_s).to eq('.56')
            expect(tag.inspect).to eq 'Tag</^.56$/>'
          end

          it 'accepts a regexp' do
            tag = Tag.new(/.56/)
            expect(tag.tag_exact).to be_nil
            expect(tag.tag_re).to eq(/.56/)
            expect(tag.to_s).to eq('.56')
            expect(tag.inspect).to eq 'Tag</.56/>'
          end

          it 'accepts a position index' do
            index = Position.new(2)
            tag = Tag.new('650', index)
            expect(tag.index).to eq(index)
          end

          it 'accepts a range index' do
            index = AlNumRange.new(3, nil)
            tag = Tag.new('650', index)
            expect(tag.index).to eq(index)
          end
        end

        describe :apply do
          attr_reader :marc_record

          before(:each) do
            @marc_record = MARC::XMLReader.new('spec/data/sandburg.xml').first
          end

          it 'finds the leader' do
            result = Tag.new('LDR').apply(marc_record)
            expect(result).to be_an(Array)
            expect(result.size).to eq(1)

            leader = result.first
            expect(leader).to eq(marc_record.leader)
          end

          it 'finds a control field' do
            result = Tag.new('003').apply(marc_record)
            expect(result).to be_an(Array)
            expect(result.size).to eq(1)

            cf003 = result.first
            expect(cf003).to be_a(MARC::ControlField)
            expect(cf003.tag).to eq('003')
          end

          it 'finds a data field' do
            result = Tag.new('245').apply(marc_record)
            expect(result).to be_an(Array)
            expect(result.size).to eq(1)

            df245 = result.first
            expect(df245).to eq(marc_record['245'])
          end

          it 'finds a repeated data field' do
            result = Tag.new('650').apply(marc_record)
            expect(result).to be_an(Array)
            expect(result.size).to eq(5)

            expected = marc_record.fields('650')
            expect(result).to eq(expected)
          end

          it 'finds some repeated data fields by position index' do
            result = Tag.new('650', Position.new(2)).apply(marc_record)
            expect(result).to be_an(Array)
            expect(result.size).to eq(1)

            df650s = marc_record.fields('650')
            expect(result.first).to eq(df650s[2])
          end

          it 'finds some repeated data fields by range index' do
            result = Tag.new('650', AlNumRange.new(1, 3)).apply(marc_record)
            expect(result).to be_an(Array)
            expect(result.size).to eq(3)

            df650s = marc_record.fields('650')
            expected = [1, 2, 3].map { |i| df650s[i] }
            expect(result).to eq(expected)
          end

          describe 'wildcards' do
            it 'finds a control field' do
              result = Tag.new('0.3').apply(marc_record)
              expect(result).to be_an(Array)
              expect(result.size).to eq(1)

              cf003 = result.first
              expect(cf003).to be_a(MARC::ControlField)
              expect(cf003.tag).to eq('003')
            end

            it 'finds a mix of control and data fields' do
              result = Tag.new('..5').apply(marc_record)
              expect(result).to be_an(Array)
              expect(result.size).to eq(2)

              cf005 = result.first
              expect(cf005).to be_a(MARC::ControlField)
              expect(cf005.tag).to eq('005')

              df245 = result.last
              expect(df245).to be_a(MARC::DataField)
              expect(df245.tag).to eq('245')
            end

            it 'finds fields by index' do
              result = Tag.new('2..', Position.new(1)).apply(marc_record)
              expect(result).to be_an(Array)
              expect(result.size).to eq(1)

              df250 = result.first
              expect(df250).to eq(marc_record['250'])
            end
          end
        end
      end
    end
  end
end
