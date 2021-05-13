require_relative 'formatter'

module ParserSpecs
  class Test
    include Formatter
    include Comparable

    GROUP_RE = /^(?<group>[^&]+) (?<detail>&& .*)$/.freeze

    attr_reader :description
    attr_reader :valid
    attr_reader :parse_method
    attr_reader :group
    attr_reader :detail
    attr_reader :json_path

    def initialize(description, valid, parse_method, json_path, assertions = {})
      @description = normalize_description(description)
      @valid = valid
      @parse_method = parse_method
      @group, @detail = group_and_detail_from(@description)
      @json_path = json_path
      assertions.each { |d, v| add_assertion(d, v) }
    end

    def assertions
      @assertions ||= {}
    end

    def rspec_assertions
      assertions.map do |data, valid|
        "expect(parser.#{parse_method}).#{valid ? 'to' : 'not_to'} parse(#{quote(data)}, trace: true, reporter: reporter)"
      end
    end

    def add_assertion(data, valid)
      raise ArgumentError, "#{quote(description)}: #{quote(data)}: #{valid} != #{self.valid}" if valid != self.valid

      assertions[data] = valid
    end

    def merge?(o)
      return false unless o.class == self.class
      raise ArgumentError, "Can't merge #{quote(description)} with self" if o.equal?(self)

      o.description == description && o.valid == valid && o.parse_method == parse_method
    end

    def merge(o)
      o.assertions.each { |d, v| add_assertion(d, v) }
    end

    # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    def <=>(other)
      return unless other.class == self.class
      return 0 if other.equal?(self)

      order = description <=> other.description
      return order if order != 0

      order = valid <=> other.valid
      return order if order != 0

      order = parse_method <=> other.parse_method
      return order if order != 0

      order = assertions.size <=> other.assertions.size
      return order if order != 0

      assertions.keys.zip(other.assertions.keys).each do |d1, d2|
        order = d1 <=> d2
        return order if order != 0
      end

      0
    end
    # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

    class << self
      def from_ostruct(ostr, parse_method, json_path)
        Test.new(ostr.description, ostr.valid, parse_method, json_path, { ostr.data => ostr.valid })
      end
    end

    private

    def group_and_detail_from(desc)
      return unless (match_data = GROUP_RE.match(desc))

      [match_data[:group], match_data[:detail]]
    end

    def normalize_description(desc)
      desc.sub(/^.* wild combination: /, '').to_s
    end
  end
end
