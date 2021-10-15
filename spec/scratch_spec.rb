require 'spec_helper'
require 'parslet/rig/rspec'

# Scratch spec for particular use cases
module MarcSpec
  module Parsing
    describe Parser do
      let(:parser) { Parser.new }
      let(:reporter) { Parslet::ErrorReporter::Deepest.new }

      def try_parse(data, method = :marc_spec)
        sub_parser = parser.send(method)
        expect(sub_parser).to parse(data, trace: true, reporter: reporter)
        sub_parser.parse(data)
      end

      describe :_comparison_string do
        it 'parses' do
          data = '\\A'
          result = try_parse(data, :_comparison_string)
          puts "#{data}\t#{result.inspect}"
        end

        it 'handles curly braces' do
          data = '\\}'
          result = try_parse(data, :_comparison_string)
          puts "#{data}\t#{result.inspect}"
        end

        it 'handles literal backslashes' do
          data = '\\\\'
          result = try_parse(data, :_comparison_string)
          puts "#{data}\t#{result.inspect}"
        end

        it 'handles other escapes' do
          data = '\\bang\\!'
          result = try_parse(data, :_comparison_string)
          puts "#{data}\t#{result.inspect}"
        end

        context 'as a sub_term' do
          it 'parses as a sub_term' do
            data = '\\A'
            result = try_parse(data, :sub_term)
            puts "#{data}\t#{result.inspect}"
          end
        end

        context 'as a sub_term_set' do
          it 'parses as a sub_term_set' do
            data = '\\A'
            result = try_parse(data, :sub_term_set)
            puts "#{data}\t#{result.inspect}"
          end
        end

        context 'as a sub_spec body' do
          it 'parses as a sub_spec body' do
            data = '{\\A}'
            result = try_parse(data, :sub_spec)
            puts "#{data}\t#{result.inspect}"
          end

          it 'handles internal curly braces' do
            data = '{\\}}'
            result = try_parse(data, :sub_spec)
            puts "#{data}\t#{result.inspect}"
          end
        end
      end

      describe :subfield_spec do
        it 'parses' do
          data = '245$a'
          result = try_parse(data, :subfield_spec)
          puts "#{data}\t#{result.inspect}"
        end

        it 'parses as a sub_term' do
          data = '245$a'
          result = try_parse(data, :sub_term)
          puts "#{data}\t#{result.inspect}"
        end

        it 'parses as a sub_term_set' do
          data = '245$a'
          result = try_parse(data, :sub_term_set)
          puts "#{data}\t#{result.inspect}"
        end

        it 'parses as a sub_term_set with an operator' do
          data = '245$a=246$b'
          result = try_parse(data, :sub_term_set)
          puts "#{data}\t#{result.inspect}"
        end

        it 'parses as a sub_spec body' do
          data = '{245$a}'
          result = try_parse(data, :sub_spec)
          puts "#{data}\t#{result.inspect}"
        end

        it 'parses a subfield code range' do
          data = '245$1-3'
          result = try_parse(data, :subfield_spec)
          puts "#{data}\t#{result.inspect}"
        end
      end
    end
  end
end
