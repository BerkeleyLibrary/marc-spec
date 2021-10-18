require 'spec_helper'

module MARC::Spec
  module Queries
    describe Query do
      attr_reader :parser
      attr_reader :xform
      attr_reader :marc_record

      before(:each) do
        @parser = Parsing::Parser.new
        @xform = Transform.new
      end

      def subfield_codes(df)
        df.subfields.map(&:code)
      end

      def subfields(df, code)
        codes = Array(code)
        df.subfields.select { |sf| codes.include?(sf.code) }
      end

      def verify_all(examples)
        aggregate_failures { examples.each { |query_str, expected| verify_result(query_str, expected) } }
      end

      def parse_query(query_str)
        MARC::Spec.parse_query(query_str)
      end

      def verify_result(query_str, expected)
        query = parse_query(query_str)
        executor = QueryExecutor.new(marc_record, query)
        actual = executor.execute

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

      describe :to_s do
        it 'includes all elements' do
          # noinspection RubyLiteralArrayInspection
          [
            '245$a',
            '245$a/1-5',
            '245^1',
            '245$a$b',
            '245^1{=\\0}',
            '245$a{$b=\\t}$c$d'
          ].each do |query_str|
            query = parse_query(query_str)
            str = query.to_s
            expect(str).not_to include('nil')
            all_elements = ([query.tag, query.selector] + query.subqueries).compact
            all_elements.each do |elem|
              expect(str).to include(elem.to_s)
            end
          end
        end
      end

      describe :tag_str do
        it 'returns the tag' do
          examples = {
            '245$a{$b=\\t}$c$d' => '245',
            '...$a$c' => '...',
            '008/22{LDR/6=\b}' => '008',
            '008[0]/3{/0=\a}' => '008[0]'
          }
          aggregate_failures do
            examples.each do |query_str, expected|
              query = parse_query(query_str)
              expect(query.tag_str).to eq(expected)
            end
          end
        end
      end

      describe :to_s_inspect do
        it 'includes all elements' do
          # noinspection RubyLiteralArrayInspection
          [
            '245$a',
            '245$a/1-5',
            '245^1',
            '245$a$b',
            '245^1{=\\0}',
            '245$a{$b=\\t}$c$d'
          ].each do |query_str|
            query = parse_query(query_str)
            inspect_str = query.inspect
            expect(inspect_str).not_to include('nil')
            all_elements = ([query.tag, query.selector] + query.subqueries).compact
            all_elements.each do |elem|
              expect(inspect_str).to include(elem.inspect)
            end
          end
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
            df245a = subfields(df245, 'a').first
            df245c = subfields(df245, 'c').first
            df245ac = subfields(df245, %w[a c])

            all_sf_a_or_c = marc_record.fields.each_with_object([]) do |df, sff|
              next unless df.respond_to?(:subfields)

              sff.concat(subfields(df, %w[a c]))
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

            _650s = marc_record.fields('650')
            _650s_with_x = _650s.select { |df| subfield_codes(df).include?('x') }

            examples = {
              '245$a{?245$c}' => [df245a], # left subterm is implicit, and unused
              '245$a{245$a?245$c}' => [df245a], # left subterm is explicit, but unused
              '245$a{!245$c}' => [],
              '245$a{245$a!245$c}' => [],
              # 650 subfield a if that 650 also has a subfield x
              '650$a{?$x}' => _650s_with_x.flat_map { |df| subfields(df, 'a') },
              # all 650 subfields a if any 650 has a subfield x
              '650$a{?650$x}' => _650s.flat_map { |df| subfields(df, 'a') }
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
