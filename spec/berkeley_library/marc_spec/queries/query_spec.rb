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

        def verify_all(examples)
          aggregate_failures { examples.each { |query_str, expected| verify_result(query_str, expected) } }
        end

        def verify_result(query_str, expected)
          parse_tree = parser.parse(query_str)
          query = xform.apply(parse_tree)
          actual = query.apply(marc_record)
          expect(actual).to eq(expected), failure_msg_for(query_str, query, actual, expected)
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

          context 'leader' do
            it 'finds the leader' do
              leader = marc_record.leader
              examples = {
                'LDR' => [leader],
                'LDR/11' => [leader[11]],
                'LDR/3-12' => [leader[3..12]]
              }

              verify_all(examples)
            end
          end

          context 'subfields' do
            it 'finds the expected result' do
              df245 = marc_record['245']
              df245a = df245.subfields.find { |sf| sf.code == 'a' }
              df245ac = df245.subfields.select { |sf| %w[a c].include?(sf.code) }

              all_sf_a_or_c = marc_record.fields.each_with_object([]) do |df, sff|
                next unless df.respond_to?(:subfields)

                df.subfields.each { |sf| sff << sf if %w[a c].include?(sf.code) }
              end

              examples = {
                '245$a' => [df245a],
                '245$a$c' => df245ac,
                '245$a-c' => df245ac,
                '...$a$c' => all_sf_a_or_c
              }

              verify_all(examples)
            end
          end
        end
      end
    end
  end
end
