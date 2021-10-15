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

    def subfield_codes(df)
      df.subfields.map(&:code)
    end

    def subfields(df, code)
      codes = Array(code)
      df.subfields.select { |sf| codes.include?(sf.code) }
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
            '260$a' => subfields(_260, 'a'),
            '260$a$b$c' => subfields(_260, %w[a b c]),
            '260$a-c' => subfields(_260, %w[a b c]),
            '...$a$c' => marc_record.fields.each_with_object([]) do |f, sff|
              next unless f.respond_to?(:subfields)

              sff.concat(subfields(f, %w[a c]))
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
            '650[0]$a' => subfields(_650s[0], 'a')
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

        context '9.7 SubSpecs' do
          context '9.7.1 General' do
            it 'checking existence/nonexistence of fields' do
              all_020c = subfields(marc_record['020'], 'c')
              _650s = marc_record.fields('650')
              _650s_with_x = _650s.select { |df| subfield_codes(df).include?('x') }
              examples = {
                '020$c{?020$a}' => all_020c,
                '020$c{020$c?020$a}' => all_020c,
                # 650 subfield a if that 650 also has a subfield x
                '650$a{?$x}' => _650s_with_x.flat_map { |df| subfields(df, 'a') },
                # all 650 subfields a if any 650 has a subfield x
                '650$a{?650$x}' => _650s.flat_map { |df| subfields(df, 'a') },
                '020$c{!020$z}' => all_020c,
                '020$c{020$c!020$z}' => all_020c
              }
              check_all(examples)
            end

            it 'checking values against comparison strings' do
              _008 = marc_record['008']
              _245 = marc_record['245']
              examples = {
                '008/22{LDR/6=\a}' => _008.value[22],
                '008/22{LDR/6=\b}' => [],
                '245$c{008/22=\j}' => subfields(_245, 'c'),
                '245$c{008/22=\q}' => [],
                '245$c{008/22=\q|008/22=\j}' => subfields(_245, 'c'),
                '245$c{LDR/6=\a}{008/22=\q|008/22=\j}' => subfields(_245, 'c'),
                '245$c{LDR/6=\q}{008/22=\q|008/22=\j}' => [],
                '245$c{008/22=\q|008/22=\j}{LDR/6=\q}' => []
              }
              check_all(examples)
            end
          end

          context '9.7.2 Abbreviations' do
            it 'matches against a fixed field value substring' do
              _008 = marc_record['008']
              examples = {
                '008/3{/0=\9}' => _008.value[3],
                '008/3{008/0=\9}' => _008.value[3],
                '008/3{/0=\a}' => [],
                '008[0]/3{/0=\9}' => _008.value[3],
                '008[0]/3{008[0]/0=\9}' => _008.value[3],
                '008[0]/3{/0=\a}' => []
              }
              check_all(examples)
            end

            it 'matches against a subfield value' do
              _020 = marc_record['020']
              all_020_c = subfields(_020, 'c')
              _245 = marc_record['245']
              all_245_a = subfields(_245, 'a')
              examples = {
                '020$c{$a}' => all_020_c,
                '020$c{020$a}' => all_020_c,
                '020$c{$z}' => [],
                '020$c{020$z}' => [],
                '245$a{/#=\\/}' => all_245_a,
                '245$a{/#=\\;}' => [],
                '245$a{245$a/#=\\/}' => all_245_a,
                '245$a{245$a/#=\\;}' => []
              }
              check_all(examples)
            end
          end
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
          all_998a = subfields(_998, 'a')
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
