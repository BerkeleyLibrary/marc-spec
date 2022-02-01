Dir.glob(File.expand_path('spec/*.rb', __dir__)).sort.each(&method(:require))

module MARC
  module Spec
    class << self

      def find(query_string, marc_record)
        root = parse_query(query_string)
        execute_query(root, marc_record)
      end

      def exists?(query_string, marc_record)
        root = parse_query(query_string)
        executor = executor_for(root, marc_record)
        executor.any_results?
      end

      def parse_query(query_string)
        parse_tree = parser.parse(query_string, reporter: reporter)
        xform_result = xform.apply(parse_tree)
        # TODO: unify these?
        xform_result.is_a?(Queries::Query) ? xform_result : Queries::Query.new(tag: xform_result)
      rescue Parslet::ParseFailed => e
        raise ArgumentError, "Unable to parse query: #{query_string.inspect}: #{e}"
      end

      def execute_query(query, marc_record)
        executor = executor_for(query, marc_record)
        executor.execute
      end

      private

      def parser
        @parser ||= Parsing::Parser.new
      end

      def xform
        @xform ||= Queries::Transform.new
      end

      def reporter
        @reporter ||= Parslet::ErrorReporter::Contextual.new
      end

      def executor_for(query, marc_record)
        Queries::QueryExecutor.new(marc_record, query)
      end
    end
  end
end
