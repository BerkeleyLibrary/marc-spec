require 'parslet'
require 'marc/spec/parse_utils'

module MARC
  module Spec
    # rubocop:disable Style/BlockDelimiters
    class Parser < Parslet::Parser
      include ParseUtils

      # alphaupper        = %x41-5A
      #                     ; A-Z
      rule(:alpha_upper) { match['A-Z'] }

      # alphalower        = %x61-7A
      #                     ; a-z
      rule(:alpha_lower) { match['a-z'] }

      # DIGIT             =  %x30-39
      #                     ; 0-9
      rule(:digit) { match['0-9'] }

      # VCHAR             =  %x21-7E
      #                     ; visible (printing) characters
      rule(:vchar) { match['\u0021-\u007e'] }

      # positiveDigit     = %x31-39
      #                     ;  "1" / "2" / "3" / "4" / "5" / "6" / "7" / "8" / "9"
      rule(:positive_digit) { match['1-9'] }

      # positiveInteger   = "0" / positiveDigit [1*DIGIT]
      rule(:positive_integer) { str('0') | (positive_digit >> digit.repeat) }

      # fieldTag          = 3(alphalower / DIGIT / ".") / 3(alphaupper / DIGIT / ".")
      rule(:field_tag) {
        (alpha_lower | digit | str('.')).repeat(3, 3) | (alpha_upper | digit | str('.')).repeat(3, 3)
      }

      # position          = positiveInteger / "#"
      rule(:position) { positive_integer | str('#') }

      # range             = position "-" position
      #
      # NOTE: n-# means from position n to end of string;
      #       #-n means from (last index - n) to end of string
      rule(:range) { (position.as(:start) >> str('-#')) | str('#-') >> position.as(:end) | IntRange.new }

      # positionOrRange   = range / position
      rule(:position_or_range) { range | position }

      # characterSpec     = "/" positionOrRange
      rule(:character_spec) { str('/') >> position_or_range }

      # index             = "[" positionOrRange "]"
      rule(:index) { str('[') >> position_or_range >> str(']') }

      # fieldSpec         = fieldTag [index] [characterSpec]
      rule(:field_spec) { field_tag >> index.maybe >> character_spec.maybe }

      # abrFieldSpec      = index [characterSpec] / characterSpec
      rule(:abr_field_spec) { (index >> character_spec.maybe) | character_spec }

      # subfieldChar      = %x21-3F / %x5B-7B / %x7D-7E
      #                     ; ! " # $ % & ' ( ) * + , - . / 0-9 : ; < = > ? [ \ ] ^ _ \` a-z { } ~
      rule(:subfield_char) { match['\u0021-\u003f'] | match['\u005b-\u007b'] | match['\u007d-\u007e'] }

      # subfieldCode      = "$" subfieldChar
      rule(:subfield_code) { str('$') >> subfield_char }

      # UNDOCUMENTED -- see spec/suite/valid/validSubfieldRange.json
      rule(:subfield_range) { (alpha_lower >> str('-') >> alpha_lower) | (digit >> str('-') >> digit) }

      # subfieldCodeRange = "$" ( (alphalower "-" alphalower) / (DIGIT "-" DIGIT) )
      #                     ; [a-z]-[a-z] / [0-9]-[0-9]
      rule(:subfield_code_range) { str('$') >> subfield_range }

      # abrSubfieldSpec   = (subfieldCode / subfieldCodeRange) [index] [characterSpec]
      rule(:abr_subfield_spec) { (subfield_code | subfield_code_range) >> index.maybe >> character_spec.maybe }

      # subfieldSpec      = fieldTag [index] abrSubfieldSpec
      rule(:subfield_spec) { field_tag >> index.maybe >> abr_subfield_spec }

      # UNDOCUMENTED -- see spec/suite/valid/validIndicators.json
      rule(:indicators) { str('1') | str('2') }

      # abrIndicatorSpec  = [index] "^" ("1" / "2")
      rule(:abr_indicator_spec) { index.maybe >> str('^') >> indicators }

      # indicatorSpec     = fieldTag abrIndicatorSpec
      rule(:indicator_spec) { field_tag >> abr_indicator_spec }

      # comparisonString  = "\" *VCHAR
      rule(:comparison_string) { str('\\') >> vchar.repeat } # TODO: why is the test so different?

      # operator          = "=" / "!=" / "~" / "!~" / "!" / "?"
      #                     ; equal / unequal / includes / not includes / not exists / exists
      rule(:operator) { str('=') | str('!=') | str('~') | str('!~') | str('!') | str('?') }

      # abbreviation      = abrFieldSpec / abrSubfieldSpec / abrIndicatorSpec
      rule(:abbreviation) { abr_field_spec | abr_subfield_spec | abr_indicator_spec }

      # subTerm           = fieldSpec / subfieldSpec / indicatorSpec / comparisonString / abbreviation
      rule(:sub_term) { field_spec | subfield_spec | indicator_spec | comparison_string | abbreviation }

      # subTermSet        = [ [subTerm] operator ] subTerm
      rule(:sub_term_set) { (sub_term.maybe >> operator).maybe >> sub_term }

      # subSpec           = "{" subTermSet *( "|" subTermSet ) "}"
      rule(:sub_spec) { sub_term_set >> (str('|') >> sub_term_set).repeat }

      # MARCspec          = fieldSpec *subSpec / (subfieldSpec *subSpec *(abrSubfieldSpec *subSpec)) / indicatorSpec *subSpec
      rule(:marc_spec) {
        (field_spec >> sub_spec.repeat) |
          (subfield_spec >> sub_spec.repeat >> (abr_subfield_spec >> sub_spec.repeat).repeat) |
          (indicator_spec >> sub_spec.repeat)
      }

      root(:marc_spec)
    end

    # rubocop:enable Style/BlockDelimiters
  end
end
