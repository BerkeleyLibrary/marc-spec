require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve
module BerkeleyLibrary
  module MarcSpec
    module Parser
      describe ParserImpl do
        parser = ParserImpl.new
        tags = %w[245 2.. 24. .45 ..5 ... LDR]
        positions = %w[0 7 17 317]
        pos_ranges = [%w[1 12], %w[1 #], %w[# 1], %w[24 56], %w[# #]]
        codes = %w[a b c 1 2 3]
        code_ranges = [%w[a c], %w[1 3]]
        inds = %w[1 2]

        let(:r) { Parslet::ErrorReporter::Deepest.new }

        describe parser.field_tag do
          tags.each do |tag|
            it "parses #{tag}" do
              expect(subject).to parse(tag)
              result = subject.parse(tag)
              expect(result).to eq(tag)
            end
          end
        end

        describe parser.position do
          %w[0 7 17 317].each do |pos|
            it "parses #{pos}" do
              expect(subject).to parse(pos, reporter: r)
            end
          end
        end

        describe parser.position_or_range do
          positions.each do |pos|
            it "parses #{pos}" do
              expect(subject).to parse(pos, reporter: r)
              result = subject.parse(pos)
              expect(result[:pos]).to eq(pos)
            end
          end

          pos_ranges.each do |from, to|
            val = "#{from}-#{to}"
            it "parses #{val}" do
              expect(subject).to parse(val, reporter: r)
              result = subject.parse(val)
              expect(result[:from]).to eq(from == '#' ? nil : from)
              expect(result[:to]).to eq(to == '#' ? nil : to)
            end
          end
        end

        describe parser.character_spec do
          positions.each do |pos|
            val = "/#{pos}"
            it "parses #{val}" do
              expect(subject).to parse(val, reporter: r)
              result = subject.parse(val)
              character_spec = result[:character_spec]
              expect(character_spec[:pos]).to eq(pos)
            end
          end

          pos_ranges.each do |from, to|
            val = "/#{from}-#{to}"
            it "parses #{val}" do
              expect(subject).to parse(val, reporter: r)
              result = subject.parse(val)
              character_spec = result[:character_spec]
              expect(character_spec[:from]).to eq(from == '#' ? nil : from)
              expect(character_spec[:to]).to eq(to == '#' ? nil : to)
            end
          end
        end

        describe parser.field_spec do
          tags.each do |tag|
            it "parses #{tag}" do
              expect(subject).to parse(tag)
              result = subject.parse(tag)
              expect(result[:tag]).to eq(tag)
            end
          end

          describe 'with substrings' do
            tags.each do |tag|
              positions.each do |pos|
                val = "#{tag}/#{pos}"
                it "parses #{val}" do
                  expect(subject).to parse(val, reporter: r)
                  result = subject.parse(val)
                  expect(result[:tag]).to eq(tag)
                  character_spec = result[:character_spec]
                  expect(character_spec[:pos]).to eq(pos)
                end
              end

              pos_ranges.each do |from, to|
                val = "#{tag}/#{from}-#{to}"
                it "parses #{val}" do
                  expect(subject).to parse(val, reporter: r)
                  result = subject.parse(val)
                  expect(result[:tag]).to eq(tag)
                  character_spec = result[:character_spec]
                  expect(character_spec[:from]).to eq(from == '#' ? nil : from)
                  expect(character_spec[:to]).to eq(to == '#' ? nil : to)
                end
              end
            end
          end

          describe 'with indices' do
            tags.each do |tag|
              positions.each do |pos_index|
                val = "#{tag}[#{pos_index}]"
                it "parses #{val}" do
                  expect(subject).to parse(val, reporter: r)
                  result = subject.parse(val)
                  expect(result[:tag]).to eq(tag)
                  index = result[:index]
                  expect(index[:pos]).to eq(pos_index)
                end
              end

              pos_ranges.each do |from_index, to_index|
                val = "#{tag}[#{from_index}-#{to_index}]"
                it "parses #{val}" do
                  expect(subject).to parse(val, reporter: r)
                  result = subject.parse(val)
                  expect(result[:tag]).to eq(tag)
                  index = result[:index]
                  expect(index[:from]).to eq(from_index == '#' ? nil : from_index)
                  expect(index[:to]).to eq(to_index == '#' ? nil : to_index)
                end
              end
            end

          end

          describe parser.subfield_code do
            codes.each do |code|
              val = "$#{code}"
              it "parses #{val}" do
                expect(subject).to parse(val, reporter: r)
                expect(subject.parse(val)).to eq({ code: code })
              end
            end
          end
        end

        describe parser.subfield_spec do
          tags.each do |tag|
            codes.each do |code|
              val = "#{tag}$#{code}"
              it "parses #{val}" do
                expect(subject).to parse(val, reporter: r)
                result = subject.parse(val)
                expect(result[:tag]).to eq(tag)
                expect(result[:subfield]).to eq({ code: code })
              end
            end

            code_ranges.each do |from, to|
              val = "#{tag}$#{from}-#{to}"
              it "parses #{val}" do
                expect(subject).to parse(val, reporter: r)
                result = subject.parse(val)
                expect(result[:tag]).to eq(tag)

                subfield = result[:subfield]
                expect(subfield).not_to be_nil

                code_range = subfield[:code_range]
                expect(code_range[:from]).to eq(from)
                expect(code_range[:to]).to eq(to)
              end
            end

            positions.each do |pos_index|
              codes.each do |code|
                val = "#{tag}[#{pos_index}]$#{code}"
                it "parses #{val}" do
                  expect(subject).to parse(val, reporter: r)
                  result = subject.parse(val)
                  expect(result[:tag]).to eq(tag)

                  index = result[:index]
                  expect(index[:pos]).to eq(pos_index)

                  subfield = result[:subfield]
                  expect(subfield).not_to be_nil
                  expect(subfield[:code]).to eq(code)
                end
              end
            end

            pos_ranges.each do |from_index, to_index|
              code_ranges.each do |from, to|
                val = "#{tag}[#{from_index}-#{to_index}]$#{from}-#{to}"
                it "parses #{val}" do
                  expect(subject).to parse(val, reporter: r)
                  result = subject.parse(val)
                  expect(result[:tag]).to eq(tag)

                  index = result[:index]
                  expect(index[:from]).to eq(from_index == '#' ? nil : from_index)
                  expect(index[:to]).to eq(to_index == '#' ? nil : to_index)

                  subfield = result[:subfield]
                  expect(subfield).not_to be_nil

                  code_range = subfield[:code_range]
                  expect(code_range[:from]).to eq(from)
                  expect(code_range[:to]).to eq(to)
                end
              end
            end
          end
        end

        describe parser.indicator_spec do
          tags.each do |tag|
            inds.each do |ind|
              val = "#{tag}^#{ind}"
              it "parses #{val}" do
                expect(subject).to parse(val)
                result = subject.parse(val)
                expect(result[:tag]).to eq(tag)
                expect(result[:ind]).to eq(ind)
              end
            end

            positions.each do |pos_index|
              inds.each do |ind|
                val = "#{tag}[#{pos_index}]^#{ind}"
                it "parses #{val}" do
                  result = subject.parse(val)
                  expect(result[:tag]).to eq(tag)
                  expect(result[:ind]).to eq(ind)
                  index = result[:index]
                  expect(index[:pos]).to eq(pos_index)
                end
              end
            end

            pos_ranges.each do |from_index, to_index|
              inds.each do |ind|
                val = "#{tag}[#{from_index}-#{to_index}]^#{ind}"
                it "parses #{val}" do
                  result = subject.parse(val)
                  expect(result[:tag]).to eq(tag)
                  expect(result[:ind]).to eq(ind)
                  index = result[:index]
                  expect(index[:from]).to eq(from_index == '#' ? nil : from_index)
                  expect(index[:to]).to eq(to_index == '#' ? nil : to_index)
                end
              end
            end
          end
        end

        describe parser do
          describe 'with multiple subfields' do
            tags.each do |tag|
              code_list = codes.map { |c| "$#{c}" }.join
              val = "#{tag}#{code_list}"
              xit "parses #{val}" do
                expect(subject).to parse(val, reporter: r)
                result = subject.parse(val)
                expect(result[:tag]).to eq(tag)
                expect(result[:codes]).to eq(codes)
              end
            end

            xit 'parses an index'
          end
        end
      end
    end
  end
end
