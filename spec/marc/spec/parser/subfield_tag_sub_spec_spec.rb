require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve
module MARC
  module Spec
    describe Parser do
      let(:parser) { Parser.new }

      describe subfield_tag_sub_spec do
        describe 'wild combination of valid field tag, subfield tag and subspec' do
          it 'lowercase alpha subfieldtag a && all wildcards' do
            expect(parser.marc_spec).to parse('...$a{245$a}', trace: true)
          end

          it 'lowercase alpha subfieldtag a && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$a{$a}', trace: true)
          end

          it 'lowercase alpha subfieldtag a && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$a{?$a}', trace: true)
          end

          it 'lowercase alpha subfieldtag a && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$a{!$a}', trace: true)
          end

          it 'lowercase alpha subfieldtag a && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$a{$a=$b}', trace: true)
          end

          it 'lowercase alpha subfieldtag a && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$a{$a!=$b}', trace: true)
          end

          it 'lowercase alpha subfieldtag a && all digits' do
            expect(parser.marc_spec).to parse('...$a{$a~\\Poe}', trace: true)
          end

          it 'lowercase alpha subfieldtag a && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$a{$a!~\\Poe}', trace: true)
          end

          it 'lowercase alpha subfieldtag a && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$a{/#=\\/}', trace: true)
          end

          it 'lowercase alpha subfieldtag a && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$a{$a|$b}{$c}', trace: true)
          end

          it 'lowercase alpha subfieldtag a && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$a{$a}{$b|$c}', trace: true)
          end

          it 'lowercase alpha subfieldtag a && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$a{$a|$b}{$c|$d}', trace: true)
          end

          it 'lowercase alpha subfieldtag a && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$a{$a|$b|$c}', trace: true)
          end

          it 'lowercase alpha subfieldtag a && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$a{$a~\\test\\$}', trace: true)
          end

          it 'lowercase alpha subfieldtag a && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$a{$a~\\test\\{}', trace: true)
          end

          it 'lowercase alpha subfieldtag a && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$a{$a~\\test\\}}', trace: true)
          end

          it 'lowercase alpha subfieldtag a && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$a{$a~\\test\\!}', trace: true)
          end

          it 'lowercase alpha subfieldtag a && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$a{$a~\\test\\=}', trace: true)
          end

          it 'lowercase alpha subfieldtag a && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$a{$a~\\test\\~}', trace: true)
          end

          it 'lowercase alpha subfieldtag a && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$a{$a~\\test\\?}', trace: true)
          end

          it 'lowercase alpha subfieldtag a && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$a{$a~\\test\\|}', trace: true)
          end

          it 'lowercase alpha subfieldtag z && all wildcards' do
            expect(parser.marc_spec).to parse('...$z{245$a}', trace: true)
          end

          it 'lowercase alpha subfieldtag z && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$z{$a}', trace: true)
          end

          it 'lowercase alpha subfieldtag z && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$z{?$a}', trace: true)
          end

          it 'lowercase alpha subfieldtag z && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$z{!$a}', trace: true)
          end

          it 'lowercase alpha subfieldtag z && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$z{$a=$b}', trace: true)
          end

          it 'lowercase alpha subfieldtag z && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$z{$a!=$b}', trace: true)
          end

          it 'lowercase alpha subfieldtag z && all digits' do
            expect(parser.marc_spec).to parse('...$z{$a~\\Poe}', trace: true)
          end

          it 'lowercase alpha subfieldtag z && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$z{$a!~\\Poe}', trace: true)
          end

          it 'lowercase alpha subfieldtag z && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$z{/#=\\/}', trace: true)
          end

          it 'lowercase alpha subfieldtag z && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$z{$a|$b}{$c}', trace: true)
          end

          it 'lowercase alpha subfieldtag z && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$z{$a}{$b|$c}', trace: true)
          end

          it 'lowercase alpha subfieldtag z && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$z{$a|$b}{$c|$d}', trace: true)
          end

          it 'lowercase alpha subfieldtag z && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$z{$a|$b|$c}', trace: true)
          end

          it 'lowercase alpha subfieldtag z && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$z{$a~\\test\\$}', trace: true)
          end

          it 'lowercase alpha subfieldtag z && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$z{$a~\\test\\{}', trace: true)
          end

          it 'lowercase alpha subfieldtag z && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$z{$a~\\test\\}}', trace: true)
          end

          it 'lowercase alpha subfieldtag z && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$z{$a~\\test\\!}', trace: true)
          end

          it 'lowercase alpha subfieldtag z && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$z{$a~\\test\\=}', trace: true)
          end

          it 'lowercase alpha subfieldtag z && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$z{$a~\\test\\~}', trace: true)
          end

          it 'lowercase alpha subfieldtag z && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$z{$a~\\test\\?}', trace: true)
          end

          it 'lowercase alpha subfieldtag z && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$z{$a~\\test\\|}', trace: true)
          end

          it 'digit subfieldtag 0 && all wildcards' do
            expect(parser.marc_spec).to parse('...$0{245$a}', trace: true)
          end

          it 'digit subfieldtag 0 && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$0{$a}', trace: true)
          end

          it 'digit subfieldtag 0 && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$0{?$a}', trace: true)
          end

          it 'digit subfieldtag 0 && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$0{!$a}', trace: true)
          end

          it 'digit subfieldtag 0 && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$0{$a=$b}', trace: true)
          end

          it 'digit subfieldtag 0 && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$0{$a!=$b}', trace: true)
          end

          it 'digit subfieldtag 0 && all digits' do
            expect(parser.marc_spec).to parse('...$0{$a~\\Poe}', trace: true)
          end

          it 'digit subfieldtag 0 && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$0{$a!~\\Poe}', trace: true)
          end

          it 'digit subfieldtag 0 && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$0{/#=\\/}', trace: true)
          end

          it 'digit subfieldtag 0 && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$0{$a|$b}{$c}', trace: true)
          end

          it 'digit subfieldtag 0 && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$0{$a}{$b|$c}', trace: true)
          end

          it 'digit subfieldtag 0 && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$0{$a|$b}{$c|$d}', trace: true)
          end

          it 'digit subfieldtag 0 && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$0{$a|$b|$c}', trace: true)
          end

          it 'digit subfieldtag 0 && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$0{$a~\\test\\$}', trace: true)
          end

          it 'digit subfieldtag 0 && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$0{$a~\\test\\{}', trace: true)
          end

          it 'digit subfieldtag 0 && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$0{$a~\\test\\}}', trace: true)
          end

          it 'digit subfieldtag 0 && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$0{$a~\\test\\!}', trace: true)
          end

          it 'digit subfieldtag 0 && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$0{$a~\\test\\=}', trace: true)
          end

          it 'digit subfieldtag 0 && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$0{$a~\\test\\~}', trace: true)
          end

          it 'digit subfieldtag 0 && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$0{$a~\\test\\?}', trace: true)
          end

          it 'digit subfieldtag 0 && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$0{$a~\\test\\|}', trace: true)
          end

          it 'digit subfieldtag 9 && all wildcards' do
            expect(parser.marc_spec).to parse('...$9{245$a}', trace: true)
          end

          it 'digit subfieldtag 9 && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$9{$a}', trace: true)
          end

          it 'digit subfieldtag 9 && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$9{?$a}', trace: true)
          end

          it 'digit subfieldtag 9 && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$9{!$a}', trace: true)
          end

          it 'digit subfieldtag 9 && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$9{$a=$b}', trace: true)
          end

          it 'digit subfieldtag 9 && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$9{$a!=$b}', trace: true)
          end

          it 'digit subfieldtag 9 && all digits' do
            expect(parser.marc_spec).to parse('...$9{$a~\\Poe}', trace: true)
          end

          it 'digit subfieldtag 9 && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$9{$a!~\\Poe}', trace: true)
          end

          it 'digit subfieldtag 9 && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$9{/#=\\/}', trace: true)
          end

          it 'digit subfieldtag 9 && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$9{$a|$b}{$c}', trace: true)
          end

          it 'digit subfieldtag 9 && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$9{$a}{$b|$c}', trace: true)
          end

          it 'digit subfieldtag 9 && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$9{$a|$b}{$c|$d}', trace: true)
          end

          it 'digit subfieldtag 9 && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$9{$a|$b|$c}', trace: true)
          end

          it 'digit subfieldtag 9 && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$9{$a~\\test\\$}', trace: true)
          end

          it 'digit subfieldtag 9 && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$9{$a~\\test\\{}', trace: true)
          end

          it 'digit subfieldtag 9 && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$9{$a~\\test\\}}', trace: true)
          end

          it 'digit subfieldtag 9 && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$9{$a~\\test\\!}', trace: true)
          end

          it 'digit subfieldtag 9 && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$9{$a~\\test\\=}', trace: true)
          end

          it 'digit subfieldtag 9 && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$9{$a~\\test\\~}', trace: true)
          end

          it 'digit subfieldtag 9 && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$9{$a~\\test\\?}', trace: true)
          end

          it 'digit subfieldtag 9 && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$9{$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag ! && all wildcards' do
            expect(parser.marc_spec).to parse('...$!{245$a}', trace: true)
          end

          it 'subfieldtag ! && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$!{$a}', trace: true)
          end

          it 'subfieldtag ! && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$!{?$a}', trace: true)
          end

          it 'subfieldtag ! && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$!{!$a}', trace: true)
          end

          it 'subfieldtag ! && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$!{$a=$b}', trace: true)
          end

          it 'subfieldtag ! && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$!{$a!=$b}', trace: true)
          end

          it 'subfieldtag ! && all digits' do
            expect(parser.marc_spec).to parse('...$!{$a~\\Poe}', trace: true)
          end

          it 'subfieldtag ! && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$!{$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag ! && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$!{/#=\\/}', trace: true)
          end

          it 'subfieldtag ! && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$!{$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag ! && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$!{$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag ! && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$!{$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag ! && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$!{$a|$b|$c}', trace: true)
          end

          it 'subfieldtag ! && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$!{$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag ! && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$!{$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag ! && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$!{$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag ! && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$!{$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag ! && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$!{$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag ! && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$!{$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag ! && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$!{$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag ! && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$!{$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag # && all wildcards' do
            expect(parser.marc_spec).to parse('...$\#{245$a}', trace: true)
          end

          it 'subfieldtag # && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$\#{$a}', trace: true)
          end

          it 'subfieldtag # && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$\#{?$a}', trace: true)
          end

          it 'subfieldtag # && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$\#{!$a}', trace: true)
          end

          it 'subfieldtag # && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$\#{$a=$b}', trace: true)
          end

          it 'subfieldtag # && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$\#{$a!=$b}', trace: true)
          end

          it 'subfieldtag # && all digits' do
            expect(parser.marc_spec).to parse('...$\#{$a~\\Poe}', trace: true)
          end

          it 'subfieldtag # && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$\#{$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag # && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$\#{/#=\\/}', trace: true)
          end

          it 'subfieldtag # && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$\#{$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag # && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$\#{$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag # && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$\#{$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag # && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$\#{$a|$b|$c}', trace: true)
          end

          it 'subfieldtag # && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$\#{$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag # && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$\#{$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag # && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$\#{$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag # && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$\#{$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag # && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$\#{$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag # && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$\#{$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag # && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$\#{$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag # && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$\#{$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag $ && all wildcards' do
            expect(parser.marc_spec).to parse('...$${245$a}', trace: true)
          end

          it 'subfieldtag $ && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$${$a}', trace: true)
          end

          it 'subfieldtag $ && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$${?$a}', trace: true)
          end

          it 'subfieldtag $ && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$${!$a}', trace: true)
          end

          it 'subfieldtag $ && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$${$a=$b}', trace: true)
          end

          it 'subfieldtag $ && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$${$a!=$b}', trace: true)
          end

          it 'subfieldtag $ && all digits' do
            expect(parser.marc_spec).to parse('...$${$a~\\Poe}', trace: true)
          end

          it 'subfieldtag $ && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$${$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag $ && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$${/#=\\/}', trace: true)
          end

          it 'subfieldtag $ && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$${$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag $ && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$${$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag $ && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$${$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag $ && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$${$a|$b|$c}', trace: true)
          end

          it 'subfieldtag $ && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$${$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag $ && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$${$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag $ && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$${$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag $ && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$${$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag $ && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$${$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag $ && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$${$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag $ && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$${$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag $ && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$${$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag % && all wildcards' do
            expect(parser.marc_spec).to parse('...$%{245$a}', trace: true)
          end

          it 'subfieldtag % && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$%{$a}', trace: true)
          end

          it 'subfieldtag % && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$%{?$a}', trace: true)
          end

          it 'subfieldtag % && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$%{!$a}', trace: true)
          end

          it 'subfieldtag % && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$%{$a=$b}', trace: true)
          end

          it 'subfieldtag % && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$%{$a!=$b}', trace: true)
          end

          it 'subfieldtag % && all digits' do
            expect(parser.marc_spec).to parse('...$%{$a~\\Poe}', trace: true)
          end

          it 'subfieldtag % && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$%{$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag % && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$%{/#=\\/}', trace: true)
          end

          it 'subfieldtag % && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$%{$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag % && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$%{$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag % && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$%{$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag % && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$%{$a|$b|$c}', trace: true)
          end

          it 'subfieldtag % && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$%{$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag % && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$%{$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag % && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$%{$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag % && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$%{$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag % && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$%{$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag % && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$%{$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag % && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$%{$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag % && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$%{$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag & && all wildcards' do
            expect(parser.marc_spec).to parse('...$&{245$a}', trace: true)
          end

          it 'subfieldtag & && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$&{$a}', trace: true)
          end

          it 'subfieldtag & && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$&{?$a}', trace: true)
          end

          it 'subfieldtag & && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$&{!$a}', trace: true)
          end

          it 'subfieldtag & && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$&{$a=$b}', trace: true)
          end

          it 'subfieldtag & && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$&{$a!=$b}', trace: true)
          end

          it 'subfieldtag & && all digits' do
            expect(parser.marc_spec).to parse('...$&{$a~\\Poe}', trace: true)
          end

          it 'subfieldtag & && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$&{$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag & && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$&{/#=\\/}', trace: true)
          end

          it 'subfieldtag & && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$&{$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag & && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$&{$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag & && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$&{$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag & && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$&{$a|$b|$c}', trace: true)
          end

          it 'subfieldtag & && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$&{$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag & && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$&{$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag & && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$&{$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag & && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$&{$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag & && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$&{$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag & && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$&{$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag & && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$&{$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag & && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$&{$a~\\test\\|}', trace: true)
          end

          it "subfieldtag ' && all wildcards" do
            expect(parser.marc_spec).to parse("...$'{245$a}", trace: true)
          end

          it "subfieldtag ' && two wildcards left with digit" do
            expect(parser.marc_spec).to parse("...$'{$a}", trace: true)
          end

          it "subfieldtag ' && one wildcard left with two digits" do
            expect(parser.marc_spec).to parse("...$'{?$a}", trace: true)
          end

          it "subfieldtag ' && wildcard between digits" do
            expect(parser.marc_spec).to parse("...$'{!$a}", trace: true)
          end

          it "subfieldtag ' && two digits wildcard right" do
            expect(parser.marc_spec).to parse("...$'{$a=$b}", trace: true)
          end

          it "subfieldtag ' && one digit two wildcards right" do
            expect(parser.marc_spec).to parse("...$'{$a!=$b}", trace: true)
          end

          it "subfieldtag ' && all digits" do
            expect(parser.marc_spec).to parse("...$'{$a~\\Poe}", trace: true)
          end

          it "subfieldtag ' && all uppercase chars special leader" do
            expect(parser.marc_spec).to parse("...$'{$a!~\\Poe}", trace: true)
          end

          it "subfieldtag ' && two wildcards left one uppercase char" do
            expect(parser.marc_spec).to parse("...$'{/#=\\/}", trace: true)
          end

          it "subfieldtag ' && one wildcard left two uppercase chars" do
            expect(parser.marc_spec).to parse("...$'{$a|$b}{$c}", trace: true)
          end

          it "subfieldtag ' && one wildcard between uppercase chars" do
            expect(parser.marc_spec).to parse("...$'{$a}{$b|$c}", trace: true)
          end

          it "subfieldtag ' && one uppercase char two wildcards right" do
            expect(parser.marc_spec).to parse("...$'{$a|$b}{$c|$d}", trace: true)
          end

          it "subfieldtag ' && mix one lowercase char and two digits" do
            expect(parser.marc_spec).to parse("...$'{$a|$b|$c}", trace: true)
          end

          it "subfieldtag ' && mix two lowercase chars and one digit" do
            expect(parser.marc_spec).to parse("...$'{$a~\\test\\$}", trace: true)
          end

          it "subfieldtag ' && all lowercase chars" do
            expect(parser.marc_spec).to parse("...$'{$a~\\test\\{}", trace: true)
          end

          it "subfieldtag ' && two wildcards and one lowercase char right" do
            expect(parser.marc_spec).to parse("...$'{$a~\\test\\}}", trace: true)
          end

          it "subfieldtag ' && one wildcard left and two lowercase chars" do
            expect(parser.marc_spec).to parse("...$'{$a~\\test\\!}", trace: true)
          end

          it "subfieldtag ' && one lowercase and two wildcards right" do
            expect(parser.marc_spec).to parse("...$'{$a~\\test\\=}", trace: true)
          end

          it "subfieldtag ' && all lowercase chars" do
            expect(parser.marc_spec).to parse("...$'{$a~\\test\\~}", trace: true)
          end

          it "subfieldtag ' && all lowercase chars" do
            expect(parser.marc_spec).to parse("...$'{$a~\\test\\?}", trace: true)
          end

          it "subfieldtag ' && all lowercase chars" do
            expect(parser.marc_spec).to parse("...$'{$a~\\test\\|}", trace: true)
          end

          it 'subfieldtag ( && all wildcards' do
            expect(parser.marc_spec).to parse('...$({245$a}', trace: true)
          end

          it 'subfieldtag ( && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$({$a}', trace: true)
          end

          it 'subfieldtag ( && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$({?$a}', trace: true)
          end

          it 'subfieldtag ( && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$({!$a}', trace: true)
          end

          it 'subfieldtag ( && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$({$a=$b}', trace: true)
          end

          it 'subfieldtag ( && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$({$a!=$b}', trace: true)
          end

          it 'subfieldtag ( && all digits' do
            expect(parser.marc_spec).to parse('...$({$a~\\Poe}', trace: true)
          end

          it 'subfieldtag ( && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$({$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag ( && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$({/#=\\/}', trace: true)
          end

          it 'subfieldtag ( && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$({$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag ( && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$({$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag ( && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$({$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag ( && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$({$a|$b|$c}', trace: true)
          end

          it 'subfieldtag ( && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$({$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag ( && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$({$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag ( && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$({$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag ( && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$({$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag ( && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$({$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag ( && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$({$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag ( && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$({$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag ( && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$({$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag ) && all wildcards' do
            expect(parser.marc_spec).to parse('...$){245$a}', trace: true)
          end

          it 'subfieldtag ) && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$){$a}', trace: true)
          end

          it 'subfieldtag ) && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$){?$a}', trace: true)
          end

          it 'subfieldtag ) && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$){!$a}', trace: true)
          end

          it 'subfieldtag ) && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$){$a=$b}', trace: true)
          end

          it 'subfieldtag ) && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$){$a!=$b}', trace: true)
          end

          it 'subfieldtag ) && all digits' do
            expect(parser.marc_spec).to parse('...$){$a~\\Poe}', trace: true)
          end

          it 'subfieldtag ) && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$){$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag ) && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$){/#=\\/}', trace: true)
          end

          it 'subfieldtag ) && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$){$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag ) && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$){$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag ) && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$){$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag ) && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$){$a|$b|$c}', trace: true)
          end

          it 'subfieldtag ) && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$){$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag ) && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$){$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag ) && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$){$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag ) && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$){$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag ) && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$){$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag ) && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$){$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag ) && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$){$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag ) && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$){$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag * && all wildcards' do
            expect(parser.marc_spec).to parse('...$*{245$a}', trace: true)
          end

          it 'subfieldtag * && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$*{$a}', trace: true)
          end

          it 'subfieldtag * && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$*{?$a}', trace: true)
          end

          it 'subfieldtag * && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$*{!$a}', trace: true)
          end

          it 'subfieldtag * && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$*{$a=$b}', trace: true)
          end

          it 'subfieldtag * && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$*{$a!=$b}', trace: true)
          end

          it 'subfieldtag * && all digits' do
            expect(parser.marc_spec).to parse('...$*{$a~\\Poe}', trace: true)
          end

          it 'subfieldtag * && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$*{$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag * && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$*{/#=\\/}', trace: true)
          end

          it 'subfieldtag * && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$*{$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag * && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$*{$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag * && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$*{$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag * && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$*{$a|$b|$c}', trace: true)
          end

          it 'subfieldtag * && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$*{$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag * && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$*{$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag * && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$*{$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag * && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$*{$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag * && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$*{$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag * && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$*{$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag * && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$*{$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag * && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$*{$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag + && all wildcards' do
            expect(parser.marc_spec).to parse('...$+{245$a}', trace: true)
          end

          it 'subfieldtag + && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$+{$a}', trace: true)
          end

          it 'subfieldtag + && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$+{?$a}', trace: true)
          end

          it 'subfieldtag + && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$+{!$a}', trace: true)
          end

          it 'subfieldtag + && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$+{$a=$b}', trace: true)
          end

          it 'subfieldtag + && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$+{$a!=$b}', trace: true)
          end

          it 'subfieldtag + && all digits' do
            expect(parser.marc_spec).to parse('...$+{$a~\\Poe}', trace: true)
          end

          it 'subfieldtag + && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$+{$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag + && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$+{/#=\\/}', trace: true)
          end

          it 'subfieldtag + && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$+{$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag + && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$+{$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag + && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$+{$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag + && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$+{$a|$b|$c}', trace: true)
          end

          it 'subfieldtag + && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$+{$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag + && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$+{$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag + && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$+{$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag + && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$+{$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag + && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$+{$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag + && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$+{$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag + && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$+{$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag + && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$+{$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag , && all wildcards' do
            expect(parser.marc_spec).to parse('...$,{245$a}', trace: true)
          end

          it 'subfieldtag , && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$,{$a}', trace: true)
          end

          it 'subfieldtag , && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$,{?$a}', trace: true)
          end

          it 'subfieldtag , && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$,{!$a}', trace: true)
          end

          it 'subfieldtag , && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$,{$a=$b}', trace: true)
          end

          it 'subfieldtag , && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$,{$a!=$b}', trace: true)
          end

          it 'subfieldtag , && all digits' do
            expect(parser.marc_spec).to parse('...$,{$a~\\Poe}', trace: true)
          end

          it 'subfieldtag , && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$,{$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag , && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$,{/#=\\/}', trace: true)
          end

          it 'subfieldtag , && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$,{$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag , && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$,{$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag , && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$,{$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag , && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$,{$a|$b|$c}', trace: true)
          end

          it 'subfieldtag , && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$,{$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag , && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$,{$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag , && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$,{$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag , && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$,{$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag , && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$,{$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag , && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$,{$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag , && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$,{$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag , && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$,{$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag - && all wildcards' do
            expect(parser.marc_spec).to parse('...$-{245$a}', trace: true)
          end

          it 'subfieldtag - && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$-{$a}', trace: true)
          end

          it 'subfieldtag - && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$-{?$a}', trace: true)
          end

          it 'subfieldtag - && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$-{!$a}', trace: true)
          end

          it 'subfieldtag - && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$-{$a=$b}', trace: true)
          end

          it 'subfieldtag - && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$-{$a!=$b}', trace: true)
          end

          it 'subfieldtag - && all digits' do
            expect(parser.marc_spec).to parse('...$-{$a~\\Poe}', trace: true)
          end

          it 'subfieldtag - && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$-{$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag - && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$-{/#=\\/}', trace: true)
          end

          it 'subfieldtag - && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$-{$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag - && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$-{$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag - && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$-{$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag - && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$-{$a|$b|$c}', trace: true)
          end

          it 'subfieldtag - && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$-{$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag - && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$-{$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag - && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$-{$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag - && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$-{$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag - && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$-{$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag - && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$-{$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag - && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$-{$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag - && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$-{$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag . && all wildcards' do
            expect(parser.marc_spec).to parse('...$.{245$a}', trace: true)
          end

          it 'subfieldtag . && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$.{$a}', trace: true)
          end

          it 'subfieldtag . && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$.{?$a}', trace: true)
          end

          it 'subfieldtag . && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$.{!$a}', trace: true)
          end

          it 'subfieldtag . && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$.{$a=$b}', trace: true)
          end

          it 'subfieldtag . && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$.{$a!=$b}', trace: true)
          end

          it 'subfieldtag . && all digits' do
            expect(parser.marc_spec).to parse('...$.{$a~\\Poe}', trace: true)
          end

          it 'subfieldtag . && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$.{$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag . && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$.{/#=\\/}', trace: true)
          end

          it 'subfieldtag . && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$.{$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag . && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$.{$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag . && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$.{$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag . && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$.{$a|$b|$c}', trace: true)
          end

          it 'subfieldtag . && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$.{$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag . && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$.{$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag . && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$.{$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag . && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$.{$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag . && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$.{$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag . && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$.{$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag . && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$.{$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag . && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$.{$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag / && all wildcards' do
            expect(parser.marc_spec).to parse('...$/{245$a}', trace: true)
          end

          it 'subfieldtag / && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$/{$a}', trace: true)
          end

          it 'subfieldtag / && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$/{?$a}', trace: true)
          end

          it 'subfieldtag / && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$/{!$a}', trace: true)
          end

          it 'subfieldtag / && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$/{$a=$b}', trace: true)
          end

          it 'subfieldtag / && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$/{$a!=$b}', trace: true)
          end

          it 'subfieldtag / && all digits' do
            expect(parser.marc_spec).to parse('...$/{$a~\\Poe}', trace: true)
          end

          it 'subfieldtag / && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$/{$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag / && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$/{/#=\\/}', trace: true)
          end

          it 'subfieldtag / && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$/{$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag / && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$/{$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag / && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$/{$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag / && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$/{$a|$b|$c}', trace: true)
          end

          it 'subfieldtag / && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$/{$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag / && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$/{$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag / && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$/{$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag / && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$/{$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag / && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$/{$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag / && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$/{$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag / && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$/{$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag / && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$/{$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag : && all wildcards' do
            expect(parser.marc_spec).to parse('...$:{245$a}', trace: true)
          end

          it 'subfieldtag : && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$:{$a}', trace: true)
          end

          it 'subfieldtag : && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$:{?$a}', trace: true)
          end

          it 'subfieldtag : && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$:{!$a}', trace: true)
          end

          it 'subfieldtag : && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$:{$a=$b}', trace: true)
          end

          it 'subfieldtag : && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$:{$a!=$b}', trace: true)
          end

          it 'subfieldtag : && all digits' do
            expect(parser.marc_spec).to parse('...$:{$a~\\Poe}', trace: true)
          end

          it 'subfieldtag : && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$:{$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag : && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$:{/#=\\/}', trace: true)
          end

          it 'subfieldtag : && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$:{$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag : && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$:{$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag : && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$:{$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag : && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$:{$a|$b|$c}', trace: true)
          end

          it 'subfieldtag : && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$:{$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag : && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$:{$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag : && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$:{$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag : && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$:{$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag : && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$:{$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag : && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$:{$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag : && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$:{$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag : && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$:{$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag ; && all wildcards' do
            expect(parser.marc_spec).to parse('...$;{245$a}', trace: true)
          end

          it 'subfieldtag ; && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$;{$a}', trace: true)
          end

          it 'subfieldtag ; && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$;{?$a}', trace: true)
          end

          it 'subfieldtag ; && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$;{!$a}', trace: true)
          end

          it 'subfieldtag ; && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$;{$a=$b}', trace: true)
          end

          it 'subfieldtag ; && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$;{$a!=$b}', trace: true)
          end

          it 'subfieldtag ; && all digits' do
            expect(parser.marc_spec).to parse('...$;{$a~\\Poe}', trace: true)
          end

          it 'subfieldtag ; && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$;{$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag ; && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$;{/#=\\/}', trace: true)
          end

          it 'subfieldtag ; && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$;{$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag ; && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$;{$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag ; && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$;{$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag ; && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$;{$a|$b|$c}', trace: true)
          end

          it 'subfieldtag ; && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$;{$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag ; && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$;{$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag ; && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$;{$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag ; && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$;{$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag ; && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$;{$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag ; && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$;{$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag ; && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$;{$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag ; && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$;{$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag < && all wildcards' do
            expect(parser.marc_spec).to parse('...$<{245$a}', trace: true)
          end

          it 'subfieldtag < && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$<{$a}', trace: true)
          end

          it 'subfieldtag < && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$<{?$a}', trace: true)
          end

          it 'subfieldtag < && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$<{!$a}', trace: true)
          end

          it 'subfieldtag < && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$<{$a=$b}', trace: true)
          end

          it 'subfieldtag < && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$<{$a!=$b}', trace: true)
          end

          it 'subfieldtag < && all digits' do
            expect(parser.marc_spec).to parse('...$<{$a~\\Poe}', trace: true)
          end

          it 'subfieldtag < && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$<{$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag < && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$<{/#=\\/}', trace: true)
          end

          it 'subfieldtag < && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$<{$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag < && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$<{$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag < && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$<{$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag < && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$<{$a|$b|$c}', trace: true)
          end

          it 'subfieldtag < && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$<{$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag < && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$<{$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag < && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$<{$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag < && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$<{$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag < && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$<{$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag < && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$<{$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag < && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$<{$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag < && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$<{$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag = && all wildcards' do
            expect(parser.marc_spec).to parse('...$={245$a}', trace: true)
          end

          it 'subfieldtag = && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$={$a}', trace: true)
          end

          it 'subfieldtag = && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$={?$a}', trace: true)
          end

          it 'subfieldtag = && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$={!$a}', trace: true)
          end

          it 'subfieldtag = && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$={$a=$b}', trace: true)
          end

          it 'subfieldtag = && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$={$a!=$b}', trace: true)
          end

          it 'subfieldtag = && all digits' do
            expect(parser.marc_spec).to parse('...$={$a~\\Poe}', trace: true)
          end

          it 'subfieldtag = && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$={$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag = && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$={/#=\\/}', trace: true)
          end

          it 'subfieldtag = && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$={$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag = && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$={$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag = && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$={$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag = && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$={$a|$b|$c}', trace: true)
          end

          it 'subfieldtag = && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$={$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag = && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$={$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag = && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$={$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag = && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$={$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag = && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$={$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag = && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$={$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag = && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$={$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag = && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$={$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag > && all wildcards' do
            expect(parser.marc_spec).to parse('...$>{245$a}', trace: true)
          end

          it 'subfieldtag > && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$>{$a}', trace: true)
          end

          it 'subfieldtag > && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$>{?$a}', trace: true)
          end

          it 'subfieldtag > && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$>{!$a}', trace: true)
          end

          it 'subfieldtag > && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$>{$a=$b}', trace: true)
          end

          it 'subfieldtag > && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$>{$a!=$b}', trace: true)
          end

          it 'subfieldtag > && all digits' do
            expect(parser.marc_spec).to parse('...$>{$a~\\Poe}', trace: true)
          end

          it 'subfieldtag > && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$>{$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag > && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$>{/#=\\/}', trace: true)
          end

          it 'subfieldtag > && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$>{$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag > && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$>{$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag > && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$>{$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag > && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$>{$a|$b|$c}', trace: true)
          end

          it 'subfieldtag > && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$>{$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag > && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$>{$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag > && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$>{$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag > && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$>{$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag > && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$>{$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag > && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$>{$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag > && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$>{$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag > && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$>{$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag ? && all wildcards' do
            expect(parser.marc_spec).to parse('...$?{245$a}', trace: true)
          end

          it 'subfieldtag ? && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$?{$a}', trace: true)
          end

          it 'subfieldtag ? && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$?{?$a}', trace: true)
          end

          it 'subfieldtag ? && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$?{!$a}', trace: true)
          end

          it 'subfieldtag ? && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$?{$a=$b}', trace: true)
          end

          it 'subfieldtag ? && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$?{$a!=$b}', trace: true)
          end

          it 'subfieldtag ? && all digits' do
            expect(parser.marc_spec).to parse('...$?{$a~\\Poe}', trace: true)
          end

          it 'subfieldtag ? && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$?{$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag ? && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$?{/#=\\/}', trace: true)
          end

          it 'subfieldtag ? && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$?{$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag ? && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$?{$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag ? && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$?{$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag ? && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$?{$a|$b|$c}', trace: true)
          end

          it 'subfieldtag ? && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$?{$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag ? && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$?{$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag ? && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$?{$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag ? && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$?{$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag ? && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$?{$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag ? && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$?{$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag ? && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$?{$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag ? && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$?{$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag [ && all wildcards' do
            expect(parser.marc_spec).to parse('...$[{245$a}', trace: true)
          end

          it 'subfieldtag [ && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$[{$a}', trace: true)
          end

          it 'subfieldtag [ && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$[{?$a}', trace: true)
          end

          it 'subfieldtag [ && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$[{!$a}', trace: true)
          end

          it 'subfieldtag [ && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$[{$a=$b}', trace: true)
          end

          it 'subfieldtag [ && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$[{$a!=$b}', trace: true)
          end

          it 'subfieldtag [ && all digits' do
            expect(parser.marc_spec).to parse('...$[{$a~\\Poe}', trace: true)
          end

          it 'subfieldtag [ && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$[{$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag [ && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$[{/#=\\/}', trace: true)
          end

          it 'subfieldtag [ && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$[{$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag [ && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$[{$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag [ && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$[{$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag [ && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$[{$a|$b|$c}', trace: true)
          end

          it 'subfieldtag [ && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$[{$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag [ && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$[{$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag [ && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$[{$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag [ && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$[{$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag [ && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$[{$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag [ && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$[{$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag [ && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$[{$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag [ && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$[{$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag \\ && all wildcards' do
            expect(parser.marc_spec).to parse('...$\\{245$a}', trace: true)
          end

          it 'subfieldtag \\ && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$\\{$a}', trace: true)
          end

          it 'subfieldtag \\ && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$\\{?$a}', trace: true)
          end

          it 'subfieldtag \\ && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$\\{!$a}', trace: true)
          end

          it 'subfieldtag \\ && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$\\{$a=$b}', trace: true)
          end

          it 'subfieldtag \\ && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$\\{$a!=$b}', trace: true)
          end

          it 'subfieldtag \\ && all digits' do
            expect(parser.marc_spec).to parse('...$\\{$a~\\Poe}', trace: true)
          end

          it 'subfieldtag \\ && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$\\{$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag \\ && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$\\{/#=\\/}', trace: true)
          end

          it 'subfieldtag \\ && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$\\{$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag \\ && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$\\{$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag \\ && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$\\{$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag \\ && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$\\{$a|$b|$c}', trace: true)
          end

          it 'subfieldtag \\ && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$\\{$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag \\ && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$\\{$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag \\ && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$\\{$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag \\ && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$\\{$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag \\ && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$\\{$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag \\ && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$\\{$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag \\ && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$\\{$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag \\ && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$\\{$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag ] && all wildcards' do
            expect(parser.marc_spec).to parse('...$]{245$a}', trace: true)
          end

          it 'subfieldtag ] && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$]{$a}', trace: true)
          end

          it 'subfieldtag ] && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$]{?$a}', trace: true)
          end

          it 'subfieldtag ] && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$]{!$a}', trace: true)
          end

          it 'subfieldtag ] && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$]{$a=$b}', trace: true)
          end

          it 'subfieldtag ] && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$]{$a!=$b}', trace: true)
          end

          it 'subfieldtag ] && all digits' do
            expect(parser.marc_spec).to parse('...$]{$a~\\Poe}', trace: true)
          end

          it 'subfieldtag ] && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$]{$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag ] && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$]{/#=\\/}', trace: true)
          end

          it 'subfieldtag ] && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$]{$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag ] && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$]{$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag ] && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$]{$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag ] && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$]{$a|$b|$c}', trace: true)
          end

          it 'subfieldtag ] && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$]{$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag ] && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$]{$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag ] && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$]{$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag ] && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$]{$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag ] && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$]{$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag ] && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$]{$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag ] && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$]{$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag ] && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$]{$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag ^ && all wildcards' do
            expect(parser.marc_spec).to parse('...$^{245$a}', trace: true)
          end

          it 'subfieldtag ^ && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$^{$a}', trace: true)
          end

          it 'subfieldtag ^ && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$^{?$a}', trace: true)
          end

          it 'subfieldtag ^ && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$^{!$a}', trace: true)
          end

          it 'subfieldtag ^ && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$^{$a=$b}', trace: true)
          end

          it 'subfieldtag ^ && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$^{$a!=$b}', trace: true)
          end

          it 'subfieldtag ^ && all digits' do
            expect(parser.marc_spec).to parse('...$^{$a~\\Poe}', trace: true)
          end

          it 'subfieldtag ^ && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$^{$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag ^ && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$^{/#=\\/}', trace: true)
          end

          it 'subfieldtag ^ && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$^{$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag ^ && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$^{$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag ^ && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$^{$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag ^ && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$^{$a|$b|$c}', trace: true)
          end

          it 'subfieldtag ^ && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$^{$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag ^ && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$^{$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag ^ && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$^{$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag ^ && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$^{$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag ^ && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$^{$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag ^ && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$^{$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag ^ && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$^{$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag ^ && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$^{$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag _ && all wildcards' do
            expect(parser.marc_spec).to parse('...$_{245$a}', trace: true)
          end

          it 'subfieldtag _ && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$_{$a}', trace: true)
          end

          it 'subfieldtag _ && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$_{?$a}', trace: true)
          end

          it 'subfieldtag _ && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$_{!$a}', trace: true)
          end

          it 'subfieldtag _ && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$_{$a=$b}', trace: true)
          end

          it 'subfieldtag _ && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$_{$a!=$b}', trace: true)
          end

          it 'subfieldtag _ && all digits' do
            expect(parser.marc_spec).to parse('...$_{$a~\\Poe}', trace: true)
          end

          it 'subfieldtag _ && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$_{$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag _ && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$_{/#=\\/}', trace: true)
          end

          it 'subfieldtag _ && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$_{$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag _ && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$_{$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag _ && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$_{$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag _ && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$_{$a|$b|$c}', trace: true)
          end

          it 'subfieldtag _ && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$_{$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag _ && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$_{$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag _ && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$_{$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag _ && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$_{$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag _ && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$_{$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag _ && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$_{$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag _ && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$_{$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag _ && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$_{$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag ` && all wildcards' do
            expect(parser.marc_spec).to parse('...$`{245$a}', trace: true)
          end

          it 'subfieldtag ` && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$`{$a}', trace: true)
          end

          it 'subfieldtag ` && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$`{?$a}', trace: true)
          end

          it 'subfieldtag ` && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$`{!$a}', trace: true)
          end

          it 'subfieldtag ` && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$`{$a=$b}', trace: true)
          end

          it 'subfieldtag ` && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$`{$a!=$b}', trace: true)
          end

          it 'subfieldtag ` && all digits' do
            expect(parser.marc_spec).to parse('...$`{$a~\\Poe}', trace: true)
          end

          it 'subfieldtag ` && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$`{$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag ` && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$`{/#=\\/}', trace: true)
          end

          it 'subfieldtag ` && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$`{$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag ` && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$`{$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag ` && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$`{$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag ` && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$`{$a|$b|$c}', trace: true)
          end

          it 'subfieldtag ` && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$`{$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag ` && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$`{$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag ` && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$`{$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag ` && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$`{$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag ` && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$`{$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag ` && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$`{$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag ` && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$`{$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag ` && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$`{$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag { && all wildcards' do
            expect(parser.marc_spec).to parse('...${{245$a}', trace: true)
          end

          it 'subfieldtag { && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...${{$a}', trace: true)
          end

          it 'subfieldtag { && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...${{?$a}', trace: true)
          end

          it 'subfieldtag { && wildcard between digits' do
            expect(parser.marc_spec).to parse('...${{!$a}', trace: true)
          end

          it 'subfieldtag { && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...${{$a=$b}', trace: true)
          end

          it 'subfieldtag { && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...${{$a!=$b}', trace: true)
          end

          it 'subfieldtag { && all digits' do
            expect(parser.marc_spec).to parse('...${{$a~\\Poe}', trace: true)
          end

          it 'subfieldtag { && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...${{$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag { && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...${{/#=\\/}', trace: true)
          end

          it 'subfieldtag { && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...${{$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag { && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...${{$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag { && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...${{$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag { && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...${{$a|$b|$c}', trace: true)
          end

          it 'subfieldtag { && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...${{$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag { && all lowercase chars' do
            expect(parser.marc_spec).to parse('...${{$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag { && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...${{$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag { && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...${{$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag { && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...${{$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag { && all lowercase chars' do
            expect(parser.marc_spec).to parse('...${{$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag { && all lowercase chars' do
            expect(parser.marc_spec).to parse('...${{$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag { && all lowercase chars' do
            expect(parser.marc_spec).to parse('...${{$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag } && all wildcards' do
            expect(parser.marc_spec).to parse('...$}{245$a}', trace: true)
          end

          it 'subfieldtag } && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$}{$a}', trace: true)
          end

          it 'subfieldtag } && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$}{?$a}', trace: true)
          end

          it 'subfieldtag } && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$}{!$a}', trace: true)
          end

          it 'subfieldtag } && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$}{$a=$b}', trace: true)
          end

          it 'subfieldtag } && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$}{$a!=$b}', trace: true)
          end

          it 'subfieldtag } && all digits' do
            expect(parser.marc_spec).to parse('...$}{$a~\\Poe}', trace: true)
          end

          it 'subfieldtag } && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$}{$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag } && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$}{/#=\\/}', trace: true)
          end

          it 'subfieldtag } && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$}{$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag } && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$}{$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag } && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$}{$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag } && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$}{$a|$b|$c}', trace: true)
          end

          it 'subfieldtag } && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$}{$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag } && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$}{$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag } && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$}{$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag } && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$}{$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag } && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$}{$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag } && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$}{$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag } && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$}{$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag } && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$}{$a~\\test\\|}', trace: true)
          end

          it 'subfieldtag ~ && all wildcards' do
            expect(parser.marc_spec).to parse('...$~{245$a}', trace: true)
          end

          it 'subfieldtag ~ && two wildcards left with digit' do
            expect(parser.marc_spec).to parse('...$~{$a}', trace: true)
          end

          it 'subfieldtag ~ && one wildcard left with two digits' do
            expect(parser.marc_spec).to parse('...$~{?$a}', trace: true)
          end

          it 'subfieldtag ~ && wildcard between digits' do
            expect(parser.marc_spec).to parse('...$~{!$a}', trace: true)
          end

          it 'subfieldtag ~ && two digits wildcard right' do
            expect(parser.marc_spec).to parse('...$~{$a=$b}', trace: true)
          end

          it 'subfieldtag ~ && one digit two wildcards right' do
            expect(parser.marc_spec).to parse('...$~{$a!=$b}', trace: true)
          end

          it 'subfieldtag ~ && all digits' do
            expect(parser.marc_spec).to parse('...$~{$a~\\Poe}', trace: true)
          end

          it 'subfieldtag ~ && all uppercase chars special leader' do
            expect(parser.marc_spec).to parse('...$~{$a!~\\Poe}', trace: true)
          end

          it 'subfieldtag ~ && two wildcards left one uppercase char' do
            expect(parser.marc_spec).to parse('...$~{/#=\\/}', trace: true)
          end

          it 'subfieldtag ~ && one wildcard left two uppercase chars' do
            expect(parser.marc_spec).to parse('...$~{$a|$b}{$c}', trace: true)
          end

          it 'subfieldtag ~ && one wildcard between uppercase chars' do
            expect(parser.marc_spec).to parse('...$~{$a}{$b|$c}', trace: true)
          end

          it 'subfieldtag ~ && one uppercase char two wildcards right' do
            expect(parser.marc_spec).to parse('...$~{$a|$b}{$c|$d}', trace: true)
          end

          it 'subfieldtag ~ && mix one lowercase char and two digits' do
            expect(parser.marc_spec).to parse('...$~{$a|$b|$c}', trace: true)
          end

          it 'subfieldtag ~ && mix two lowercase chars and one digit' do
            expect(parser.marc_spec).to parse('...$~{$a~\\test\\$}', trace: true)
          end

          it 'subfieldtag ~ && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$~{$a~\\test\\{}', trace: true)
          end

          it 'subfieldtag ~ && two wildcards and one lowercase char right' do
            expect(parser.marc_spec).to parse('...$~{$a~\\test\\}}', trace: true)
          end

          it 'subfieldtag ~ && one wildcard left and two lowercase chars' do
            expect(parser.marc_spec).to parse('...$~{$a~\\test\\!}', trace: true)
          end

          it 'subfieldtag ~ && one lowercase and two wildcards right' do
            expect(parser.marc_spec).to parse('...$~{$a~\\test\\=}', trace: true)
          end

          it 'subfieldtag ~ && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$~{$a~\\test\\~}', trace: true)
          end

          it 'subfieldtag ~ && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$~{$a~\\test\\?}', trace: true)
          end

          it 'subfieldtag ~ && all lowercase chars' do
            expect(parser.marc_spec).to parse('...$~{$a~\\test\\|}', trace: true)
          end
        end
      end
    end
  end
end
