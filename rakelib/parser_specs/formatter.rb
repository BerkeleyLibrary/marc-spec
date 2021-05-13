require 'rubocop'

module ParserSpecs
  module Formatter
    include RuboCop::Cop::Util

    def validity(v)
      v ? 'valid' : 'invalid'
    end

    def quote(s)
      to_string_literal(String.new(s))
    end

    def decamelize(str)
      return unless str

      str.gsub(/(?<!^)[A-Z]/) { "_#{$&}" }.downcase
    end

    def indent(str, indent, omit_first: true)
      return str.gsub(/^/, indent) unless omit_first

      str.gsub(/(\n)/, "\\1#{indent}")
    end

    class << self
      include Formatter
    end
  end
end
