require 'spec_helper'

module BerkeleyLibrary
  describe MarcSpec do
    attr_reader :marc_record

    def failure_msg_for(query_str, actual, expected)
      query = MarcSpec.parse_query(query_str)
      expected_str = expected.respond_to?(:map) ? expected.map(&:to_s) : expected.to_s
      actual_str = actual.respond_to?(:map) ? actual.map(&:to_s) : actual.to_s
      expected_inspect = expected.respond_to?(:map) ? expected.map(&:inspect) : expected.inspect
      actual_inspect = actual.respond_to?(:map) ? actual.map(&:inspect) : actual.inspect
      [
        query_str.inspect,
        "query:     \t#{query.inspect}",
        "expected:  \t#{expected_str}",
        "           \t#{expected_inspect}",
        "actual:    \t#{actual_str}",
        "           \t#{actual_inspect}"
      ].join("\n\t")
    end

    def check_all(examples)
      aggregate_failures do
        examples.each do |query_str, expected|
          expected = Array(expected) # simplify tests
          actual = MarcSpec.find(query_str, marc_record)
          expect(actual).to eq(expected), -> { failure_msg_for(query_str, actual, expected) }
        end
      end
    end

    describe 'non-repeated subfields' do
      before(:each) do
        @marc_record = MARC::XMLReader.new('spec/data/sandburg.xml').first
      end

      # Examples from http://marcspec.github.io/MARCspec/marc-spec.html#general-form
      describe 'examples' do
        it '9.2 Reference to field data' do
          examples = {
            'LDR' => marc_record.leader,
            '00.' => marc_record.fields.select { |f| f.tag =~ /^00.$/ },
            '7..' => marc_record.fields.select { |f| f.tag.start_with?('7') },
            '100' => marc_record.fields('100')
          }
          check_all(examples)
        end

        it '9.3 Reference to substring' do
          examples = {
            'LDR/0-4' => marc_record.leader[0..4],
            'LDR/6' => marc_record.leader[6],
            '005/0' => marc_record['005'].value[0],
            '005/1-#' => marc_record['005'].value[1..],
            '005/#' => marc_record['005'].value[-1],
            '005/#-1' => marc_record['005'].value[-2..]
          }
          check_all(examples)
        end
      end
    end
  end
end
