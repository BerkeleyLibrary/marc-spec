require 'spec_helper'

module BerkeleyLibrary
  module MarcSpec
    module Queries
      describe Query do
        attr_reader :parser
        attr_reader :xform
        attr_reader :marc_record

        before(:each) do
          @parser = Parsing::Parser.new
          @xform = Transform.new
        end

        def failure_msg_for(input_str, query, actual, expected)
          expected_str = expected.respond_to?(:map) ? expected.map(&:to_s) : expected.to_s
          actual_str = actual.respond_to?(:map) ? actual.map(&:to_s) : actual.to_s
          [
            input_str.inspect,
            "query:     \t#{query.inspect}",
            "expected:  \t#{expected_str}",
            "           \t#{expected.inspect}",
            "actual:    \t#{actual_str}",
            "           \t#{actual.inspect}"
          ].join("\n\t")
        end

        describe :from_string do
          it 'returns a query' do
            query_str = '245$a' # TODO: test more cases?

            query = Query.from_string(query_str)
            expect(query).to be_a(Query)

            parse_tree = parser.parse(query_str)
            expected = xform.apply(parse_tree)
            expect(query).to eq(expected)
          end
        end

        describe 'non-repeated subfields' do
          before(:each) do
            @marc_record = MARC::XMLReader.new('spec/data/sandburg.xml').first
          end

          it 'finds the expected result' do
            df245 = marc_record['245']
            df245a = df245.subfields.find { |sf| sf.code == 'a' }
            df245ac = df245.subfields.select { |sf| %w[a c].include?(sf.code) }

            examples = {
              '245$a' => [df245a],
              '245$a$c' => df245ac,
              '245$a-c' => df245ac
            }

            aggregate_failures do
              examples.each do |query_str, expected|
                parse_tree = parser.parse(query_str)
                query = xform.apply(parse_tree)
                actual = query.apply(marc_record)
                expect(actual).to eq(expected), failure_msg_for(query_str, query, actual, expected)
              end
            end
          end
        end
      end
    end
  end
end
