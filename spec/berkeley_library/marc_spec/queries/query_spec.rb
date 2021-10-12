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
          expect(actual).to eq(expected), -> { failure_msg_for(query_str, query, actual, expected) }
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

          context 'fields' do
            it 'finds fields' do
              examples = {
                '035' => marc_record.fields('035'),
                '040' => [marc_record['040']],
                '0..' => marc_record.fields.select { |f| f.tag =~ /^0..$/ }
              }
              verify_all(examples)
            end
          end

          context 'controlfield data' do
            it 'extracts controlfield data' do
              cf005 = marc_record['005']
              cf005_value = cf005.value
              examples = {
                '005/#' => [cf005_value[-1]],
                '005/1-#' => [cf005_value[1..]]
              }
              verify_all(examples)
            end
          end

          context 'subfields' do
            it 'finds subfields' do
              df245 = marc_record['245']
              df245a = df245.subfields.find { |sf| sf.code == 'a' }
              df245c = df245.subfields.find { |sf| sf.code == 'c' }
              df245ac = df245.subfields.select { |sf| %w[a c].include?(sf.code) }

              all_sf_a_or_c = marc_record.fields.each_with_object([]) do |df, sff|
                next unless df.respond_to?(:subfields)

                df.subfields.each { |sf| sff << sf if %w[a c].include?(sf.code) }
              end

              examples = {
                '245$a' => [df245a],
                '245$a$c' => df245ac,
                '245$a-c' => df245ac,
                '...$a$c' => all_sf_a_or_c,
                '245$a/#-6' => [df245a.value[-7..]],
                '245$a$c/0-4' => [df245a, df245c.value[0..4]],
                '245$a/0-4$c/0-4' => df245ac.map { |sf| sf.value[0..4] }
              }

              verify_all(examples)
            end
          end

          context 'subspecs' do
            it 'can check for the existence of subfields' do
              df245 = marc_record['245']
              df245a = df245.subfields.find { |sf| sf.code == 'a' }

              examples = {
                '245$a{?245$c}' => [df245a], # left subterm is implicit, and unused
                '245$a{245$a?245$c}' => [df245a], # left subterm is explicit, but unused
                '245$a{!245$c}' => [],
                '245$a{245$a!245$c}' => []
              }
              verify_all(examples)
            end

            it 'can compare subfield values' do
              df040 = marc_record['040']
              examples = {
                '040{$a=$c}' => [df040],
                '040{040$a=040$c}' => [df040]
              }
              verify_all(examples)
            end
          end
        end
      end
    end
  end
end
