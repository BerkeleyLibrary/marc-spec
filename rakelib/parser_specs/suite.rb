require_relative 'formatter'
require_relative 'test'

module ParserSpecs
  class Suite
    include Formatter
    include Comparable

    attr_reader :description, :rule, :parse_method

    def initialize(description, rule, wild, parse_method, tests = {})
      @description = normalize_description(description)
      @rule = rule
      @wild = wild
      @parse_method = parse_method
      tests.each { |t| add_test(t) }
    end

    def wild?
      @wild
    end

    def tests_by_group
      @tests_by_group ||= {}
    end

    def each_test(&block)
      return to_enum(:each_test) unless block_given?

      tests_by_group.each_value { |tests| tests.each(&block) }
    end

    def add_test(t)
      tests_for_group = (tests_by_group[t.group] ||= [])
      return (tests_for_group << t) unless (existing = tests_for_group.find { |t1| t1.merge?(t) })

      t.assertions.each { |d, v| existing.add_assertion(d, v) }
    end

    def merge?(o)
      return false unless o.class == self.class
      return true if o.equal?(self)

      o.description == description && o.parse_method == parse_method
    end

    def <=>(other)
      return unless other.class == self.class
      return 0 if other.equal?(self)

      order = self.description <=> other.description
      return order if order != 0

      order = self.parse_method <=> other.parse_method
      return order if order != 0

      order = self.tests.size <=> other.tests.size
      return order if order != 0

      self.tests.zip(other.tests).each do |t1, t2|
        order = t1 <=> t2
        return order if order != 0
      end

      0
    end

    class << self
      def from_ostruct(ostr, rule, wild)
        parse_method = wild ? 'marc_spec' : rule
        Suite.new(ostr.description, rule, wild, parse_method, ostr.tests.map { |t| Test.from_ostruct(t, parse_method) })
      end
    end

    private

    def normalize_description(desc)
      desc.sub(/^wild combination of /, '')
    end
  end
end
