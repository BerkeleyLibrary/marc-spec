require 'parslet'
require 'berkeley_library/marc_spec/parsing/closed_int_range'
require 'berkeley_library/marc_spec/parsing/closed_lc_alpha_range'

module BerkeleyLibrary
  module MarcSpec
    module Parsing
      # rubocop:disable Style/BlockDelimiters
      # noinspection RubyResolve
      class Parser < Parslet::Parser

        # ------------------------------------------------------------
        # DSL extensions

        def closed_int_range
          ClosedIntRange.new
        end

        def closed_lc_alpha_range
          ClosedLcAlphaRange.new
        end

        # ------------------------------------------------------------
        # Parsing rules

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
        #
        # NOTE: yes, this is a misnomer
        rule(:positive_integer) { str('0') | (positive_digit >> digit.repeat) }

        # fieldTag          = 3(alphalower / DIGIT / ".") / 3(alphaupper / DIGIT / ".")
        rule(:field_tag) {
          (alpha_lower | digit | str('.')).repeat(3, 3) | (alpha_upper | digit | str('.')).repeat(3, 3)
        }

        # position          = positiveInteger / "#"
        rule(:position) { positive_integer | str('#') }

        # Extracted from range, below
        #
        # NOTE: #-n means from (last index - n) to end of string
        rule(:left_open_range) { str('#').ignore.as(:from) >> str('-') >> (positive_integer | str('#').ignore).as(:to) }

        # Extracted from range, below
        #
        # NOTE: n-# means from position n to end of string
        rule(:right_open_range) { positive_integer.as(:from) >> str('-') >> str('#').ignore.as(:to) }

        # range             = position "-" position
        #
        # NOTE: n-# means from position n to end of string;
        #       #-n means from (last index - n) to end of string
        # rule(:range) { position.as(:from) >> str('-') >> position.as(:to) }
        rule(:range) { left_open_range | right_open_range | closed_int_range }

        # positionOrRange   = range / position
        rule(:position_or_range) { range | position.as(:pos) }

        # characterSpec     = "/" positionOrRange
        rule(:character_spec) { str('/') >> position_or_range.as(:character_spec) }

        # index             = "[" positionOrRange "]"
        rule(:index) { (str('[') >> position_or_range >> str(']')).as(:index) }

        # fieldSpec         = fieldTag [index] [characterSpec]
        rule(:field_spec) { field_tag.as(:tag) >> index.maybe >> character_spec.maybe }

        # abrFieldSpec      = index [characterSpec] / characterSpec
        rule(:abr_field_spec) { (index >> character_spec.maybe) | character_spec }

        # subfieldChar      = %x21-3F / %x5B-7B / %x7D-7E
        #                     ; ! " # $ % & ' ( ) * + , - . / 0-9 : ; < = > ? [ \ ] ^ _ \` a-z { } ~
        # NOTE: Not just alphanumeric; see https://github.com/MARCspec/MARCspec/issues/31
        rule(:subfield_char) { match['\u0021-\u003f'] | match['\u005b-\u007b'] | match['\u007d-\u007e'] }

        # subfieldCode      = "$" subfieldChar
        rule(:subfield_code) { str('$').ignore >> subfield_char }

        # UNDOCUMENTED -- see spec/suite/valid/validSubfieldRange.json, https://github.com/MARCspec/MARCspec-Test-Suite/issues/1
        rule(:subfield_range) { (closed_lc_alpha_range | closed_int_range) }

        # subfieldCodeRange = "$" ( (alphalower "-" alphalower) / (DIGIT "-" DIGIT) )
        #                     ; [a-z]-[a-z] / [0-9]-[0-9]
        #
        # NOTE: docs don't insist the range be valid (start <= end), but tests enforce it
        rule(:subfield_code_range) { str('$').ignore >> subfield_range }

        # abrSubfieldSpec   = (subfieldCode / subfieldCodeRange) [index] [characterSpec]
        rule(:abr_subfield_spec) { (subfield_code_range | subfield_code).as(:code) >> index.maybe >> character_spec.maybe }

        # subfieldSpec      = fieldTag [index] abrSubfieldSpec
        rule(:subfield_spec) { field_tag.as(:tag) >> index.maybe >> abr_subfield_spec.as(:subfield) }

        # UNDOCUMENTED -- see spec/suite/valid/validIndicators.json, https://github.com/MARCspec/MARCspec-Test-Suite/issues/1
        rule(:indicators) { str('1') | str('2') }

        # abrIndicatorSpec  = [index] "^" ("1" / "2")
        rule(:abr_indicator_spec) { index.maybe >> str('^') >> indicators.as(:ind) }

        # indicatorSpec     = fieldTag abrIndicatorSpec
        rule(:indicator_spec) { field_tag.as(:tag) >> abr_indicator_spec }

        # Extracted from comparisonString (some VCHARs need to be escaped,
        # and literal \ needs special handling)
        rule(:vchar_cs_plain) { match['\u0021-\u007e&&[^!$=?{|}~]'] }

        # Extracted from comparisonString (some VCHARs need to be escaped)
        rule(:vchar_cs_special) { match['!$=?{|}~'] }

        # Extracted from comparisonString (escaped)
        rule(:vchar_cs_esc) { str('\\').ignore >> vchar_cs_special }

        # Extracted from comparisonString to simplify generated tests,
        # which don't take leading \ into account
        rule(:comparison_string) {
          # escape is optional in position 1, apparently
          head = (vchar_cs_special | vchar_cs_esc) | vchar_cs_plain
          tail = (vchar_cs_esc | vchar_cs_plain).repeat
          head >> tail
        }

        # comparisonString  = "\" *VCHAR
        #
        # NOTE: generated tests only handle the body of the string, not the
        #       leading \, so we give the full rule a separate name
        rule(:_comparison_string) { str('\\').ignore >> comparison_string.as(:comparison_string) }

        # operator          = "=" / "!=" / "~" / "!~" / "!" / "?"
        #                     ; equal / unequal / includes / not includes / not exists / exists
        rule(:operator) { (str('=') | str('!=') | str('~') | str('!~') | str('!') | str('?')) }

        # abbreviation      = abrFieldSpec / abrSubfieldSpec / abrIndicatorSpec
        rule(:abbreviation) { abr_subfield_spec | abr_indicator_spec | abr_field_spec }

        # subTerm           = fieldSpec / subfieldSpec / indicatorSpec / comparisonString / abbreviation
        rule(:sub_term) { subfield_spec | indicator_spec | field_spec | _comparison_string | abbreviation }

        # subTermSet        = [ [subTerm] operator ] subTerm
        rule(:sub_term_set) { (sub_term.maybe.as(:left) >> operator.as(:operator)).maybe >> sub_term.as(:right) }

        # Extracted from subSpec for clarity
        rule(:_chained_sub_term_sets) { (sub_term_set >> (str('|') >> sub_term_set).repeat(1)).as(:any_condition) }

        # NOTE: generated tests are properly for subSpec*, so we give the
        #       single one a separate name
        #
        # subSpec           = "{" subTermSet *( "|" subTermSet ) "}"
        rule(:_sub_spec) { str('{') >> (_chained_sub_term_sets | sub_term_set) >> str('}') }

        # Extracted from SubSpec for clarity
        rule(:_repeated_sub_specs) { _sub_spec.repeat(2).as(:all_conditions) }

        # Repeated to satisfy generated tests
        rule(:sub_spec) { _repeated_sub_specs | _sub_spec }

        # Rewritten from MARCspec for clarity
        #  (subfieldSpec *subSpec *(abrSubfieldSpec *subSpec))
        #  -> (fieldTag [index] *(abrSubfieldSpec *subSpec))
        rule(:_multiple_subfield_spec) {
          (field_tag.as(:tag) >> index.maybe).as(:referent) >>
            (abr_subfield_spec.as(:referent) >> sub_spec.as(:condition).maybe).repeat(2).as(:subqueries)
        }

        # Extracted from MARCspec for clarity:
        #   (subfieldSpec *subSpec *(abrSubfieldSpec *subSpec))
        # Rewritten for ease of parsing:
        #   (fieldTag [index] *(abrSubfieldSpec *subSpec))
        rule(:_varfield_marc_spec) {
          _multiple_subfield_spec | (subfield_spec.as(:referent) >> sub_spec.as(:condition).maybe)
        }

        # Extracted from MARCspec for clarity
        # indicatorSpec *subSpec
        rule(:_indicator_marc_spec) { (indicator_spec.as(:referent) >> sub_spec.as(:condition).maybe) }

        # Extracted from MARCspec for clarity
        # fieldSpec *subSpec
        rule(:_fixedfield_marc_spec) { (field_spec.as(:referent) >> sub_spec.as(:condition).maybe) }

        # MARCspec          = fieldSpec *subSpec / (subfieldSpec *subSpec *(abrSubfieldSpec *subSpec)) / indicatorSpec *subSpec
        rule(:marc_spec) { _varfield_marc_spec | _indicator_marc_spec | _fixedfield_marc_spec }

        root(:marc_spec)
      end

      # rubocop:enable Style/BlockDelimiters
    end
  end
end
