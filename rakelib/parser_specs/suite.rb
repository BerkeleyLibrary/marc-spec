require_relative 'formatter'
require_relative 'test'

module ParserSpecs
  class Suite
    include Formatter
    include Comparable

    attr_reader :description, :parse_method, :tests

    def initialize(description, parse_method, tests = [])
      @description = description
      @parse_method = parse_method
      tests.each { |t| add_test(t) }
    end

    def tests
      @tests ||= []
    end

    def add_test(t)
      return (tests << t) unless (existing = tests.find { |t1| t1.merge?(t) })

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

    def to_rspec
      @rspec ||= begin
        test_blocks = indent(tests.map(&:to_rspec).join("\n"), '    ')

        <<~RSPEC
          describe #{quote(description)} do

            #{test_blocks}
          end # suite
        RSPEC
      end
    end

    class << self
      def from_ostruct(ostr, parse_method)
        Suite.new(ostr.description, parse_method, ostr.tests.map { |t| Test.from_ostruct(t, parse_method) })
      end
    end
  end
end
