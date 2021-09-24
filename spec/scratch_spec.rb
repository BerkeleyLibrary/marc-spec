require 'spec_helper'
require 'parslet/rig/rspec'

# Scratch spec for particular use cases
module BerkeleyLibrary
  module MarcSpec
    describe Parser do
      let(:parser) { Parser.new }
      let(:reporter) { Parslet::ErrorReporter::Deepest.new }

      def try_parse(data, method = :marc_spec)
        sub_parser = parser.send(method)
        expect(sub_parser).to parse(data, trace: true, reporter: reporter)
        sub_parser.parse(data)
      end

      describe :comparison_string do
        it 'parses' do
          data = '\\A'
          result = try_parse(data, :comparison_string)
          puts result.inspect
        end

        it 'parses as a sub_term' do
          data = '\\A'
          result = try_parse(data, :sub_term)
          puts result.inspect
        end

        it 'parses as a sub_term_set' do
          data = '\\A'
          result = try_parse(data, :sub_term_set)
          puts result.inspect
        end

        # TODO: allow } in comparison string (see https://github.com/kschiess/parslet/issues/212)
        it 'parses as a sub_spec body' do
          data = '{\\A}'
          result = try_parse(data, :sub_spec)
          puts result.inspect
        end
      end

      describe :subfield_spec do
        it 'parses' do
          data = '245$a'
          result = try_parse(data, :subfield_spec)
          puts result.inspect
        end

        it 'parses as a sub_term' do
          data = '245$a'
          result = try_parse(data, :sub_term)
          puts result.inspect
        end

        it 'parses as a sub_term_set' do
          data = '245$a'
          result = try_parse(data, :sub_term_set)
          puts result.inspect
        end

        it 'parses as a sub_term_set with an operator' do
          data = '245$a=246$b'
          result = try_parse(data, :sub_term_set)
          puts result.inspect
        end

        it 'parses as a sub_spec body' do
          data = '{245$a}'
          result = try_parse(data, :sub_spec)
          puts result.inspect
        end
      end
    end
  end
end
