require_relative 'formatter'

require 'json'
require 'ostruct'
require_relative 'formatter'
require_relative 'suite'

module ParserSpecs
  class Rule
    include Formatter

    RULE_RE = %r{/(?<wild>wildCombination_)?(?<valid>valid|invalid)(?<rule>[A-Z][[:alpha:]]+)\.json$}

    attr_reader :name

    def initialize(name, suites = [])
      @name = name
      suites.each { |s| add_suite(s) }
    end

    def to_s
      name
    end

    def suites
      @suites ||= []
    end

    def add_suite(s)
      return (suites << s) unless (existing = suites.find { |s1| s1.merge?(s) })

      s.each_test { |t| existing.add_test(t) }
    end

    def to_rspec
      @rspec ||= begin
        suite_blocks = indent(suites.map(&:to_rspec).join("\n\n"), '    ')

        <<~RSPEC
          require 'spec_helper'
          require 'parslet/rig/rspec'

          module MARC
            module Spec
              describe #{quote(name)} do
                let(:parser) { Parser.new }
                let(:reporter) { Parslet::ErrorReporter::Deepest.new }

                #{suite_blocks}
              end # rule
            end
          end
        RSPEC
      end
    end

    class << self
      include Formatter

      def all_from_json(json_root)
        Dir.glob(File.join(json_root, '*valid/*.json')).sort.each_with_object([]) do |json_path, rules|
          raise ArgumentError, "#{json_path} does not match #{RULE_RE.source}" unless (match_data = RULE_RE.match(json_path))

          rule_name = normalize_rule_name(match_data[:rule])
          wild = !(match_data[:wild].nil?)
          # puts "#{wild}\t#{json_path}"

          suite_data = JSON.parse(File.read(json_path), object_class: OpenStruct, symbolize_names: true)
          suite = Suite.from_ostruct(suite_data, rule_name, wild)

          if (existing = rules.find { |r| r.name == rule_name })
            existing.add_suite(suite)
          else
            rules << Rule.new(rule_name, [suite])
          end
        end
      end

      private

      def normalize_rule_name(name)
        return unless name

        decamelize(name).tap do |n|
          return 'subfield_char' if n == 'subfield_tag' # suite doesn't match spec
        end
      end
    end
  end
end
