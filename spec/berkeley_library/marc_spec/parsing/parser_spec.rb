require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve
module BerkeleyLibrary
  module MarcSpec
    module Parsing
      describe Parser do
        let(:parser) { Parser.new }
        let(:tags) { %w[245 2.. 24. .45 ..5 ... LDR] }
        let(:positions) { %w[0 3 5] }
        let(:pos_ranges) { [%w[1 3], %w[1 #], %w[# 1], %w[2 4], %w[# #]] }
        let(:codes) { %w[b 2 $ \\ { }] }
        let(:code_ranges) { [%w[a c], %w[1 3]] }
        let(:inds) { %w[1 2] }

        let(:r) { Parslet::ErrorReporter::Deepest.new }

        describe :field_tag do
          let(:rule) { parser.field_tag }

          it 'parses tags' do
            aggregate_failures do
              tags.each do |tag|
                expect(rule).to parse(tag)
                result = rule.parse(tag)
                expect(result).to eq(tag)
              end
            end
          end
        end

        describe :position do
          let(:rule) { parser.position }

          it 'parses positions' do
            aggregate_failures do
              %w[0 7 17 317].each do |pos|
                expect(rule).to parse(pos, reporter: r)
              end
            end
          end
        end

        describe :position_or_range do
          let(:rule) { parser.position_or_range }

          it 'parses positions' do
            aggregate_failures do
              positions.each do |pos|
                expect(rule).to parse(pos, reporter: r)
                result = rule.parse(pos)
                expect(result[:pos]).to eq(pos)
              end
            end
          end

          it 'parses ranges' do
            aggregate_failures do
              pos_ranges.each do |from, to|
                val = "#{from}-#{to}"
                expect(rule).to parse(val, reporter: r)
                result = rule.parse(val)
                expect(result[:from]).to eq(from == '#' ? nil : from)
                expect(result[:to]).to eq(to == '#' ? nil : to)
              end
            end
          end
        end

        describe :character_spec do
          let(:rule) { parser.character_spec }

          it 'parses positions' do
            aggregate_failures do
              positions.each do |pos|
                val = "/#{pos}"
                expect(rule).to parse(val, reporter: r)
                result = rule.parse(val)
                character_spec = result[:character_spec]
                expect(character_spec[:pos]).to eq(pos)
              end
            end
          end

          it 'parses ranges' do
            aggregate_failures do
              pos_ranges.each do |from, to|
                val = "/#{from}-#{to}"
                expect(rule).to parse(val, reporter: r)
                result = rule.parse(val)
                character_spec = result[:character_spec]
                expect(character_spec[:from]).to eq(from == '#' ? nil : from)
                expect(character_spec[:to]).to eq(to == '#' ? nil : to)
              end
            end
          end
        end

        describe :field_spec do
          let(:rule) { parser.field_spec }

          it 'parses tags' do
            aggregate_failures do
              tags.each do |tag|
                expect(rule).to parse(tag)
                result = rule.parse(tag)
                expect(result[:tag]).to eq(tag)
              end
            end
          end

          describe 'with substrings' do
            it 'parses positions' do
              aggregate_failures do
                tags.each do |tag|
                  positions.each do |pos|
                    val = "#{tag}/#{pos}"
                    expect(rule).to parse(val, reporter: r)
                    result = rule.parse(val)
                    expect(result[:tag]).to eq(tag)
                    selector = result[:selector]
                    character_spec = selector[:character_spec]
                    expect(character_spec[:pos]).to eq(pos)
                  end
                end
              end
            end

            it 'parses ranges' do
              aggregate_failures do
                tags.each do |tag|
                  pos_ranges.each do |from, to|
                    val = "#{tag}/#{from}-#{to}"
                    expect(rule).to parse(val, reporter: r)
                    result = rule.parse(val)
                    expect(result[:tag]).to eq(tag)
                    selector = result[:selector]
                    character_spec = selector[:character_spec]
                    expect(character_spec[:from]).to eq(from == '#' ? nil : from)
                    expect(character_spec[:to]).to eq(to == '#' ? nil : to)
                  end
                end
              end
            end
          end

          describe 'with indices' do
            it 'parses positions' do
              aggregate_failures do
                tags.each do |tag|
                  positions.each do |pos_index|
                    val = "#{tag}[#{pos_index}]"
                    expect(rule).to parse(val, reporter: r)
                    result = rule.parse(val)
                    expect(result[:tag]).to eq(tag)
                    index = result[:index]
                    expect(index[:pos]).to eq(pos_index)
                  end
                end
              end
            end

            it 'parses ranges' do
              aggregate_failures do
                tags.each do |tag|
                  pos_ranges.each do |from_index, to_index|
                    val = "#{tag}[#{from_index}-#{to_index}]"
                    expect(rule).to parse(val, reporter: r)
                    result = rule.parse(val)
                    expect(result[:tag]).to eq(tag)
                    index = result[:index]
                    expect(index[:from]).to eq(from_index == '#' ? nil : from_index)
                    expect(index[:to]).to eq(to_index == '#' ? nil : to_index)
                  end
                end
              end
            end
          end
        end

        describe :subfield_code do
          let(:rule) { parser.subfield_code }

          it 'parses codes' do
            aggregate_failures do
              codes.each do |code|
                val = "$#{code}"
                expect(rule).to parse(val, reporter: r)
                expect(rule.parse(val)).to eq(code)
              end
            end
          end
        end

        describe :subfield_spec do
          let(:rule) { parser.subfield_spec }

          it 'parses codes' do
            aggregate_failures do
              tags.each do |tag|
                codes.each do |code|
                  val = "#{tag}$#{code}"
                  expect(rule).to parse(val, reporter: r)
                  result = rule.parse(val)
                  expect(result[:tag]).to eq(tag)
                  selector = result[:selector]
                  expect(selector[:subfield]).to eq({ code: code })
                end
              end
            end
          end

          it 'parses code ranges' do
            aggregate_failures do
              tags.each do |tag|
                code_ranges.each do |from, to|
                  val = "#{tag}$#{from}-#{to}"
                  expect(rule).to parse(val, reporter: r)
                  result = rule.parse(val)
                  expect(result[:tag]).to eq(tag)

                  selector = result[:selector]
                  subfield = selector[:subfield]
                  expect(subfield).not_to be_nil

                  code_range = subfield[:code]
                  expect(code_range[:from]).to eq(from)
                  expect(code_range[:to]).to eq(to)
                end
              end
            end
          end

          it 'parses codes with indices' do
            aggregate_failures do
              tags.each do |tag|
                positions.each do |pos_index|
                  codes.each do |code|
                    val = "#{tag}[#{pos_index}]$#{code}"
                    expect(rule).to parse(val, reporter: r)
                    result = rule.parse(val)
                    expect(result[:tag]).to eq(tag)

                    index = result[:index]
                    expect(index[:pos]).to eq(pos_index)

                    selector = result[:selector]
                    subfield = selector[:subfield]
                    expect(subfield).not_to be_nil
                    expect(subfield[:code]).to eq(code)
                  end
                end
              end
            end
          end

          it 'parses code ranges with indices' do
            pos_ranges.each do |from_index, to_index|
              aggregate_failures do
                tags.each do |tag|
                  code_ranges.each do |from, to|
                    val = "#{tag}[#{from_index}-#{to_index}]$#{from}-#{to}"
                    expect(rule).to parse(val, reporter: r)
                    result = rule.parse(val)
                    expect(result[:tag]).to eq(tag)

                    index = result[:index]
                    expect(index[:from]).to eq(from_index == '#' ? nil : from_index)
                    expect(index[:to]).to eq(to_index == '#' ? nil : to_index)

                    selector = result[:selector]
                    subfield = selector[:subfield]
                    expect(subfield).not_to be_nil

                    code_range = subfield[:code]
                    expect(code_range[:from]).to eq(from)
                    expect(code_range[:to]).to eq(to)
                  end
                end
              end
            end
          end
        end

        describe :indicator_spec do
          let(:rule) { parser.indicator_spec }

          it 'parses indicators with plain tags' do
            aggregate_failures do
              tags.each do |tag|
                inds.each do |ind|
                  val = "#{tag}^#{ind}"
                  expect(rule).to parse(val)
                  result = rule.parse(val)
                  expect(result[:tag]).to eq(tag)
                  selector = result[:selector]
                  expect(selector[:ind]).to eq(ind)
                end
              end
            end
          end

          it 'parses indicators with position-indexed tags' do
            aggregate_failures do
              tags.each do |tag|
                positions.each do |pos_index|
                  inds.each do |ind|
                    val = "#{tag}[#{pos_index}]^#{ind}"
                    result = rule.parse(val)
                    expect(result[:tag]).to eq(tag)
                    selector = result[:selector]
                    expect(selector[:ind]).to eq(ind)
                    index = result[:index]
                    expect(index[:pos]).to eq(pos_index)
                  end
                end
              end
            end
          end

          it 'parses indicators with range-indexed tags' do
            aggregate_failures do
              tags.each do |tag|
                pos_ranges.each do |from_index, to_index|
                  inds.each do |ind|
                    val = "#{tag}[#{from_index}-#{to_index}]^#{ind}"
                    result = rule.parse(val)
                    expect(result[:tag]).to eq(tag)
                    selector = result[:selector]
                    expect(selector[:ind]).to eq(ind)
                    index = result[:index]
                    expect(index[:from]).to eq(from_index == '#' ? nil : from_index)
                    expect(index[:to]).to eq(to_index == '#' ? nil : to_index)
                  end
                end
              end
            end
          end
        end

        describe 'with multiple subfields' do
          it 'parses subfield code lists' do
            aggregate_failures do
              tags.each do |tag|
                code_list = codes.map { |c| "$#{c}" }.join
                val = "#{tag}#{code_list}"
                expect(parser).to parse(val, reporter: r)
                result = parser.parse(val)

                expect(result[:tag]).to eq(tag)

                subqueries = result[:subqueries]
                expect(subqueries.size).to eq(codes.size)
                subqueries.each_with_index do |subquery, i|
                  selector = subquery[:selector]
                  subfield = selector[:subfield]
                  expect(subfield[:code]).to eq(codes[i])
                end
              end
            end
          end

          it 'handles indices' do
            aggregate_failures do
              tags.each do |tag|
                pos_ranges.each do |from_index, to_index|
                  code_list = codes.map { |c| "$#{c}" }.join
                  val = "#{tag}[#{from_index}-#{to_index}]#{code_list}"
                  expect(parser).to parse(val, reporter: r)
                  result = parser.parse(val)

                  expect(result[:tag]).to eq(tag)
                  index = result[:index]
                  expect(index[:from]).to eq(from_index == '#' ? nil : from_index)
                  expect(index[:to]).to eq(to_index == '#' ? nil : to_index)

                  subqueries = result[:subqueries]
                  expect(subqueries.size).to eq(codes.size)
                  subqueries.each_with_index do |subquery, i|
                    selector = subquery[:selector]
                    subfield = selector[:subfield]
                    expect(subfield[:code]).to eq(codes[i])
                  end
                end
              end
            end
          end

          it 'parses subfield code lists with conditions' do
            aggregate_failures do
              tags.each do |tag|
                pos_ranges.each do |from_index, to_index|
                  code_list = codes.map.with_index { |c, i| "$#{c}{~\\ok#{i}}" }.join
                  val = "#{tag}[#{from_index}-#{to_index}]#{code_list}"
                  expect(parser).to parse(val, reporter: r)
                  result = parser.parse(val)

                  expect(result[:tag]).to eq(tag)
                  index = result[:index]
                  expect(index[:from]).to eq(from_index == '#' ? nil : from_index)
                  expect(index[:to]).to eq(to_index == '#' ? nil : to_index)

                  subqueries = result[:subqueries]
                  expect(subqueries.size).to eq(codes.size)
                  subqueries.each_with_index do |subquery, i|
                    selector = subquery[:selector]
                    subfield = selector[:subfield]
                    expect(subfield[:code]).to eq(codes[i])
                    condition = subquery[:condition]
                    expect(condition[:operator]).to eq('~')
                    right_operand = condition[:right]
                    expect(right_operand[:comparison_string]).to eq("ok#{i}")
                  end
                end
              end
            end
          end

          it 'handles complex combinations of subfields and subspecs' do
            val = '880$a{?$f}$b$c$e{$f=\\q}'

            expect(parser).to parse(val, reporter: r)
            result = parser.parse(val)
            expect(result[:tag]).to eq('880')

            subqueries = result[:subqueries]
            expect(subqueries.size).to eq(4)

            expect(subqueries[0][:selector]).to eq({ subfield: { code: 'a' } })
            condition0 = subqueries[0][:condition]
            expect(condition0[:operator]).to eq('?')
            expect(condition0[:right][:selector]).to eq({ subfield: { code: 'f' } })

            expect(subqueries[1][:selector]).to eq({ subfield: { code: 'b' } })

            expect(subqueries[2][:selector]).to eq({ subfield: { code: 'c' } })

            expect(subqueries[3][:selector]).to eq({ subfield: { code: 'e' } })
            condition3 = subqueries[3][:condition]
            expect(condition3[:left][:selector]).to eq({ subfield: { code: 'f' } })
            expect(condition3[:operator]).to eq('=')
            expect(condition3[:right]).to eq({ comparison_string: 'q' })
          end
        end
      end
    end
  end
end
