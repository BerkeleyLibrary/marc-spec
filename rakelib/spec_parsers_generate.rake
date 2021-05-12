require 'json'
require 'ostruct'
require 'rubocop'

# TODO: Make this a class
namespace :spec do
  namespace :parsers do
    desc 'regenerates the parser spec suite from MARCSpec-Test-Suite'
    task :generate do
      quote = ->(s) { s.include?('\'') ? s.inspect : s.inspect.sub(/^"(.*)"$/, "'\\1'") }
      format_validity = ->(v) { v ? 'valid' : 'invalid' }

      parser_specs_path = 'spec/marc/spec/parser'
      template_path = 'spec/marc/spec/parser_specs.rb.txt.erb'
      template = ERB.new(File.read(template_path), trim_mode: '-')
      template.filename = template_path

      rule_re = %r{/(?<wild>wildCombination_)?(?:valid|invalid)(?<rule>[A-Z][[:alpha:]]+)\.json$}

      specs_by_rule = {}
      wild_specs_by_rule = {}

      Dir.glob('spec/suite/*valid/*.json').sort.map do |json_file|
        raise ArgumentError, "#{json_file} does not match /#{rule_re.source}/" unless (md = rule_re.match(json_file))

        spec = JSON.parse(File.read(json_file), object_class: OpenStruct)
        rule = md[:rule].gsub(/(?<!^)[A-Z]/) { "_#{$&}" }.downcase # camel to snake case
        rule = 'subfield_char' if rule == 'subfield_tag' # suite doesn't match spec

        spec.description = quote.call(spec.description)

        if md[:wild]
          spec.parse_method = 'marc_spec'
          spec.tests.each { |t| t.description = t.description.sub(/^(?:in)?valid wild combination: /, '') }
          specs = (wild_specs_by_rule["wild_#{rule}"] ||= [])
        else
          spec.parse_method = rule
          specs = (specs_by_rule[rule] ||= [])
        end

        spec.tests.each do |t|
          t.description << " (#{format_validity.call(t.valid)})"
          t.description = quote.call(t.description)
          t.data = quote.call(t.data)
        end

        specs << spec
      end

      (specs_by_rule.keys | wild_specs_by_rule.keys).each do |rule|
        specs = (specs_by_rule[rule] || []) + (wild_specs_by_rule[rule] || [])
        spec_path = File.join(parser_specs_path, "#{rule}_spec.rb")
        puts "Writing #{specs.size} specs to #{spec_path}"
        spec_source = template.result(binding).gsub(/ +$/, '')
        File.write(spec_path, spec_source)
        RuboCop::CLI.new.run([spec_path])
      end
    end
  end
end

# class ParserSpecSuite < OpenStruct
#
#   attr_reader :rule, :tests, :parse_method
#
#   def []=(name, value)
#     return self.rule = value if name.to_s == 'rule'
#     return self.tests = value if name.to_s == 'tests'
#     return self.wild = value if name.to_s == 'wild'
#
#     raise ArgumentError, "Unknown key: #{name}"
#   end
#
#   def [](name)
#     return self.rule if name.to_s == 'rule'
#     return self.tests if name.to_s == 'tests'
#     return self.wild if name.to_s == 'wild'
#
#     raise ArgumentError, "Unknown key: #{name}"
#   end
#
#   def rule=(v)
#     @rule = decamelize(v).tap do |r|
#       r.sub!(/^subfield_tag$/, 'subfield_char') # suite doesn't match spec
#     end
#   end
#
#   def tests=(value)
#     @tests = value&.map {|v| ParserSpecTest.new(v, self)}
#   end
#
#   def wild=(value)
#     @wild = value || false
#   end
#
#   def wild?
#     @wild
#   end
#
#   def parse_method
#     wild ? 'marc_spec' : rule
#   end
#
#   private
#
#   def decamelize(str)
#     return unless str
#
#     str.gsub(/(?<!^)[A-Z]/) { "_#{$&}" }.downcase
#   end
# end
#
# class ParserSpecTest
#   def initialize(h, suite)
#     self.suite = suite || h['suite']
#     self.description = h['description']
#     self.data = h['data']
#   end
#
#   def []=(name, value)
#     return self.suite = value if name.to_s == 'suite'
#     return self.description = value if name.to_s == 'description'
#     return self.data = value if name.to_s == 'data'
#
#     raise ArgumentError, "Unknown key: #{name}"
#   end
#
#   def wild?
#     suite.wild?
#   end
#
#   def description=(v)
#     @description = normalize_description(v)
#   end
#
#   def description
#     @description = normalize_description(v)
#   end
#
#   private
#
#   def normalize_description(v)
#     wild? ? v&.sub(/^(?:in)?valid wild combination: /, '') : v
#   end
# end

class ParserSpecSuite
  include RuboCop::Cop::Util
  include Comparable

  attr_reader :description, :rule

  def initialize(ostr)
    @description = ostr.description
    @rule = normalize_rule(ostr.rule)
    @valid = ostr.valid
    @wild = ostr.wild
    ostr.tests.each { |t| self.add_test(ParserSpecTest.new(t, suite: self)) }
  end

  def valid?
    @valid
  end

  def wild?
    @wild
  end

  def parse_method
    wild? ? 'marc_spec' : rule
  end

  def can_merge?(suite)
    suite.is_a?(ParserSpecSuite) && suite.metadata == metadata
  end

  def merge!(suite)
    raise ArgumentError, "Can't merge suite #{suite}" unless can_merge?(suite)

    suite.each_test { |t| self.add_test(t) }
  end

  def metadata
    [description, rule, valid?, wild?]
  end

  def tests
    tests_by_metadata.values
  end

  def each_test(&block)
    return to_enum(:each_test) unless block_given?

    tests_by_metadata.each_value(&block)
  end

  def add_test(t)
    test_metadata = t.metadata
    return tests_by_metadata[test_metadata] = t unless (existing = tests_by_metadata[test_metadata])

    existing.merge!(t)
  end

  def to_s
    metadata.join('/')
  end

  def to_rspec
    @rspec ||= [].tap do |lines|
      lines << "describe #{to_string_literal('description')} do"
      each_test do |t|
        t.to_rspec.lines(chomp:true).each do |l|
          lines << "  #{l}"
        end
      end
      lines << 'end'
    end.join("\n")
  end

  def <=>(o)
    return unless o.class == self.class

    order = rule <=> o.rule
    return order unless order == 0

    return 1 if wild? unless o.wild?
    return -1 if valid? unless o.valid?

    order = description <=> o.description
    return description unless order == 0

    order = tests.size <=> o.tests.size
    return order unless order == 0

    to_rspec <=> o.to_rspec # TODO: something smarter
  end

  private

  def tests_by_metadata
    @tests_by_metadata ||= {}
  end

  def normalize_rule(str)
    return unless str

    decamelize(str).tap do |rule|
      return 'subfield_char' if rule == 'subfield_tag' # suite doesn't match spec
    end
  end

  def decamelize(str)
    return unless str

    str.gsub(/(?<!^)[A-Z]/) { "_#{$&}" }.downcase
  end
end

class ParserSpecTest
  include RuboCop::Cop::Util
  include Comparable

  attr_reader :suite, :description, :expectations

  def initialize(ostr, suite:)
    @suite = suite
    @description = ostr.description
    @expectations = [ostr.data => ostr.valid]
  end

  def rule
    suite.rule
  end

  def can_merge?(test)
    test.is_a?(ParserSpecTest) && test.metadata == metadata
  end

  def merge!(test)
    @expectations = expectations.tap do |exps|
      test.expectations.each do |data, valid|
        next exps[data] = valid unless exps.key?(data)

        raise ArgumentError, "Can't merge #{test}; incompatible expectations: #{to_string_literal(data)} => #{exps[data]}, #{valid}" if valid != exps[data]
      end
    end
  end

  def to_s
    metadata.join('/')
  end

  def to_rspec
    @rspec ||= [].tap do |lines|
      lines << "it #{to_string_literal('description')} do"
      expectations.each do |data, valid|
        lines << "  #{exp_to_rspec(data, valid)}"
      end
      lines << 'end'
    end.join("\n")
  end

  def metadata
    [rule, suite.description, description]
  end

  def add_expectation(data, valid)
    if (existing = expectations[data])
      return if existing == valid

      raise ArgumentError, "Can't set expectation: #{to_string_literal(data)} => #{valid}; conflicts with existing expectation #{existing}"
    end
  end

  def <=>(o)
    return unless o.class == self.class

    order = suite <=> o.suite
    return order unless order == 0

    order = description <=> o.description
    return order unless order == 0

    order = expectations.size <=> o.expectations.size
    return order unless order == 0

    to_rspec <=> o.to_rspec # TODO: something smarter
  end

  private

  def exp_to_rspec(data, valid)
    "expect(parser.#{spec.parse_method}).".tap do |rspec|
      rspec << 'not_' unless valid
      rspec << "to parse(#{to_string_literal(data)}, trace: true, reporter: Parslet::ErrorReporter::Deepest.new)"
    end
  end

  def normalize_description(v)
    wild? ? v&.sub(/^(?:in)?valid wild combination: /, '') : v
  end
end

class ParserSpecGenerator
  include Enumerable

  RULE_RE = %r{/(?<wild>wildCombination_)?(?<valid>valid|invalid)(?<rule>[A-Z][[:alpha:]]+)\.json$}

  def initialize(root)
    find_all_specs(root).each { self.add_spec(s) }
  end

  def each
    return to_enum(:each) unless block_given?

    specs_by_rule.each do |rule, specs|
      yield rule, specs.sort
    end
  end

  def add_spec(spec)
    specs_for_rule = (specs_by_rule[spec.rule] ||= {})
    return specs_for_rule[spec.metadata] = spec unless (existing = specs_for_rule[spec.metadata])

    existing.merge!(spec)
  end

  private

  def specs_by_rule
    @specs_by_rule ||= {}
  end

  def find_all_specs(root)
    spec_glob = File.join(root, '*valid/*.json')
    Dir.glob(spec_glob).sort.map { |json_path| spec_from(json_path) }
  end

  def spec_from(json_path)
    raise ArgumentError, "#{json_path} does not match #{RULE_RE.source}" unless (md = RULE_RE.match(json_path))

    spec_data = JSON.parse(File.read(json_path), object_class: OpenStruct.new, symbolize_names: true)
    spec_data.rule = md[:rule]
    spec_data.valid = md[:valid] == 'valid'
    spec_data.wild = !md[:wild].nil?

    ParserSpecSuite.new(spec_data)
  end
end
