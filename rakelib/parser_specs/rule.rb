require 'json'
require 'ostruct'
require_relative 'formatter'
require_relative 'suite'

module ParserSpecs
  class Rule
    include Formatter

    RULE_RE = %r{/(?<wild>wildCombination_)?(?<valid>valid|invalid)(?<rule>[A-Z][[:alpha:]]+)\.json$}.freeze

    TEMPLATE_PATH = File.expand_path('parser_specs.rb.txt.erb', __dir__)

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

      existing.merge(s)
    end

    def write_rspec_to(dir)
      basename = "#{name}_spec.rb"
      spec_path = File.join(dir, basename)

      # ideally we could just run the ERB as-is, but it's hard to write
      # a legible template that doesn't introduce some unwanted whitespace
      spec_src = Rule.template.result(binding)
        .gsub(/ +$/, '')
        .gsub(/\n\n+/, "\n\n")

      puts "writing #{basename}"
      File.write(spec_path, spec_src)
    end

    class << self
      include Formatter

      def all_from_json(json_root)
        Dir.glob(File.join(json_root, '*valid/*.json')).sort.each_with_object([]) do |json_path, rules|
          rule_name, wild = extract_rule_metadata(json_path)

          suite_data = JSON.parse(File.read(json_path), object_class: OpenStruct, symbolize_names: true)
          suite = Suite.from_ostruct(suite_data, rule_name, wild, json_path.sub(json_root, ''))

          add_suite(rules, rule_name, suite)
        end
      end

      def template
        @template ||= begin
          template_src = File.read(TEMPLATE_PATH)
          ERB.new(template_src, trim_mode: '-')
        end
      end

      private

      def extract_rule_metadata(json_path)
        raise ArgumentError, "#{json_path} does not match #{RULE_RE.source}" unless (match_data = RULE_RE.match(json_path))

        [normalize_rule_name(match_data[:rule]), !match_data[:wild].nil?]
      end

      def add_suite(rules, rule_name, suite)
        if (existing = rules.find { |r| r.name == rule_name })
          existing.add_suite(suite)
        else
          rules << Rule.new(rule_name, [suite])
        end
      end

      def normalize_rule_name(name)
        return unless name

        decamelize(name).tap do |n|
          return 'subfield_char' if n == 'subfield_tag' # suite doesn't match spec
        end
      end
    end
  end
end
