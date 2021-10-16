Dir.glob(File.expand_path('spec/*.rb', __dir__)).sort.each(&method(:require))

module MARC
  module Spec
    class << self
      def find(query_string, marc_record)
        root = parse_query(query_string)
        executor = Queries::QueryExecutor.new(marc_record, root)
        executor.execute
      end

      def parse_query(query_string)
        parse_tree = parser.parse(query_string, reporter: reporter)
        xform.apply(parse_tree)
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
    end
  end
end