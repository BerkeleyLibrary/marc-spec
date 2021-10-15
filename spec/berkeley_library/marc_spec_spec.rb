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
          expected = [expected] unless expected.is_a?(Array)
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
          leader = marc_record.leader
          _005 = marc_record['005']
          examples = {
            'LDR/0-4' => leader[0..4],
            'LDR/6' => leader[6],
            '005/0' => _005.value[0],
            '005/1-#' => _005.value[1..],
            '005/#' => _005.value[-1],
            '005/#-1' => _005.value[-2..]
          }
          check_all(examples)
        end

        it '9.4 Reference to data content' do
          _260 = marc_record['260']
          examples = {
            '260$a' => _260.subfields.select { |sf| sf.code == 'a' },
            '260$a$b$c' => _260.subfields.select { |sf| %w[a b c].include?(sf.code) },
            '260$a-c' => _260.subfields.select { |sf| %w[a b c].include?(sf.code) },
            '...$a$c' => marc_record.fields.each_with_object([]) do |f, sff|
              next unless f.respond_to?(:subfields)

              sff.concat(f.subfields.select { |sf| %w[a c].include?(sf.code) })
            end
          }
          check_all(examples)
        end

        it '9.5 Reference to occurrence' do
          _650s = marc_record.fields('650')
          examples = {
            '650' => _650s,
            '650[0]' => _650s[0],
            '650[1]' => _650s[1],
            '650[0-2]' => _650s[0..2],
            '650[1-#]' => _650s[1..],
            '650[#-1]' => _650s[-2..],
            '650[0]$a' => _650s[0].subfields.select { |sf| sf.code == 'a' }
          }
          check_all(examples)
        end

        it '9.6 Reference to indicator values' do
          _650s = marc_record.fields('650')
          examples = {
            '650^1' => _650s.map(&:indicator1),
            '650[1]^2' => _650s[1].indicator2
          }
          check_all(examples)
        end
      end
    end

    describe 'repeated subfields' do
      before(:each) do
        @marc_record = MARC::XMLReader.new('spec/data/b23161018-sru.xml').first
      end

      describe 'examples' do
        it '9.5 Reference to occurrence' do
          _998 = marc_record['998']
          all_998a = _998.subfields.select { |sf| sf.code == 'a' }
          examples = {
            '998$a[0]' => all_998a.first,
            '998$a[#]' => all_998a.last,
            '998$a[#-1]' => all_998a[-2..]
          }
          check_all(examples)
        end
      end
    end
  end
end
