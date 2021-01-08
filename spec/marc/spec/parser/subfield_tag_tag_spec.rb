require 'spec_helper'
require 'parslet/rig/rspec'

# noinspection RubyResolve
module MARC
  module Spec
    describe Parser do
      let(:parser) { Parser.new }

      describe subfield_tag_tag do
        describe 'wild combination of valid field tag and subfield tags' do
          it 'lowercase alpha subfieldtag a && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$a$a', trace: true)
          end

          it 'lowercase alpha subfieldtag a && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$a$z', trace: true)
          end

          it 'lowercase alpha subfieldtag a && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$a$0', trace: true)
          end

          it 'lowercase alpha subfieldtag a && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$a$9', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$a$!', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$a$#', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$a$$', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$a$%', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$a$&', trace: true)
          end

          it "lowercase alpha subfieldtag a && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$a$'", trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$a$(', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$a$)', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$a$*', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$a$+', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$a$,', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$a$-', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$a$.', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$a$/', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$a$:', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$a$;', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$a$<', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$a$=', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$a$>', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$a$?', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$a$[', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$a$\\', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$a$]', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$a$^', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$a$_', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$a$`', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$a${', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$a$}', trace: true)
          end

          it 'lowercase alpha subfieldtag a && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$a$~', trace: true)
          end

          it 'lowercase alpha subfieldtag z && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$z$a', trace: true)
          end

          it 'lowercase alpha subfieldtag z && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$z$z', trace: true)
          end

          it 'lowercase alpha subfieldtag z && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$z$0', trace: true)
          end

          it 'lowercase alpha subfieldtag z && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$z$9', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$z$!', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$z$#', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$z$$', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$z$%', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$z$&', trace: true)
          end

          it "lowercase alpha subfieldtag z && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$z$'", trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$z$(', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$z$)', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$z$*', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$z$+', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$z$,', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$z$-', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$z$.', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$z$/', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$z$:', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$z$;', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$z$<', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$z$=', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$z$>', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$z$?', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$z$[', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$z$\\', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$z$]', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$z$^', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$z$_', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$z$`', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$z${', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$z$}', trace: true)
          end

          it 'lowercase alpha subfieldtag z && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$z$~', trace: true)
          end

          it 'digit subfieldtag 0 && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$0$a', trace: true)
          end

          it 'digit subfieldtag 0 && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$0$z', trace: true)
          end

          it 'digit subfieldtag 0 && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$0$0', trace: true)
          end

          it 'digit subfieldtag 0 && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$0$9', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$0$!', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$0$#', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$0$$', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$0$%', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$0$&', trace: true)
          end

          it "digit subfieldtag 0 && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$0$'", trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$0$(', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$0$)', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$0$*', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$0$+', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$0$,', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$0$-', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$0$.', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$0$/', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$0$:', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$0$;', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$0$<', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$0$=', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$0$>', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$0$?', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$0$[', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$0$\\', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$0$]', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$0$^', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$0$_', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$0$`', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$0${', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$0$}', trace: true)
          end

          it 'digit subfieldtag 0 && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$0$~', trace: true)
          end

          it 'digit subfieldtag 9 && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$9$a', trace: true)
          end

          it 'digit subfieldtag 9 && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$9$z', trace: true)
          end

          it 'digit subfieldtag 9 && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$9$0', trace: true)
          end

          it 'digit subfieldtag 9 && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$9$9', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$9$!', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$9$#', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$9$$', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$9$%', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$9$&', trace: true)
          end

          it "digit subfieldtag 9 && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$9$'", trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$9$(', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$9$)', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$9$*', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$9$+', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$9$,', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$9$-', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$9$.', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$9$/', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$9$:', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$9$;', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$9$<', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$9$=', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$9$>', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$9$?', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$9$[', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$9$\\', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$9$]', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$9$^', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$9$_', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$9$`', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$9${', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$9$}', trace: true)
          end

          it 'digit subfieldtag 9 && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$9$~', trace: true)
          end

          it 'subfieldtag ! && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$!$a', trace: true)
          end

          it 'subfieldtag ! && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$!$z', trace: true)
          end

          it 'subfieldtag ! && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$!$0', trace: true)
          end

          it 'subfieldtag ! && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$!$9', trace: true)
          end

          it 'subfieldtag ! && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$!$!', trace: true)
          end

          it 'subfieldtag ! && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$!$#', trace: true)
          end

          it 'subfieldtag ! && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$!$$', trace: true)
          end

          it 'subfieldtag ! && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$!$%', trace: true)
          end

          it 'subfieldtag ! && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$!$&', trace: true)
          end

          it "subfieldtag ! && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$!$'", trace: true)
          end

          it 'subfieldtag ! && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$!$(', trace: true)
          end

          it 'subfieldtag ! && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$!$)', trace: true)
          end

          it 'subfieldtag ! && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$!$*', trace: true)
          end

          it 'subfieldtag ! && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$!$+', trace: true)
          end

          it 'subfieldtag ! && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$!$,', trace: true)
          end

          it 'subfieldtag ! && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$!$-', trace: true)
          end

          it 'subfieldtag ! && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$!$.', trace: true)
          end

          it 'subfieldtag ! && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$!$/', trace: true)
          end

          it 'subfieldtag ! && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$!$:', trace: true)
          end

          it 'subfieldtag ! && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$!$;', trace: true)
          end

          it 'subfieldtag ! && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$!$<', trace: true)
          end

          it 'subfieldtag ! && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$!$=', trace: true)
          end

          it 'subfieldtag ! && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$!$>', trace: true)
          end

          it 'subfieldtag ! && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$!$?', trace: true)
          end

          it 'subfieldtag ! && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$!$[', trace: true)
          end

          it 'subfieldtag ! && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$!$\\', trace: true)
          end

          it 'subfieldtag ! && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$!$]', trace: true)
          end

          it 'subfieldtag ! && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$!$^', trace: true)
          end

          it 'subfieldtag ! && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$!$_', trace: true)
          end

          it 'subfieldtag ! && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$!$`', trace: true)
          end

          it 'subfieldtag ! && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$!${', trace: true)
          end

          it 'subfieldtag ! && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$!$}', trace: true)
          end

          it 'subfieldtag ! && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$!$~', trace: true)
          end

          it 'subfieldtag # && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$\#$a', trace: true)
          end

          it 'subfieldtag # && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$\#$z', trace: true)
          end

          it 'subfieldtag # && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$\#$0', trace: true)
          end

          it 'subfieldtag # && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$\#$9', trace: true)
          end

          it 'subfieldtag # && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$\#$!', trace: true)
          end

          it 'subfieldtag # && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$\#$#', trace: true)
          end

          it 'subfieldtag # && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$\#$$', trace: true)
          end

          it 'subfieldtag # && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$\#$%', trace: true)
          end

          it 'subfieldtag # && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$\#$&', trace: true)
          end

          it "subfieldtag # && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$\#$'", trace: true)
          end

          it 'subfieldtag # && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$\#$(', trace: true)
          end

          it 'subfieldtag # && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$\#$)', trace: true)
          end

          it 'subfieldtag # && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$\#$*', trace: true)
          end

          it 'subfieldtag # && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$\#$+', trace: true)
          end

          it 'subfieldtag # && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$\#$,', trace: true)
          end

          it 'subfieldtag # && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$\#$-', trace: true)
          end

          it 'subfieldtag # && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$\#$.', trace: true)
          end

          it 'subfieldtag # && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$\#$/', trace: true)
          end

          it 'subfieldtag # && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$\#$:', trace: true)
          end

          it 'subfieldtag # && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$\#$;', trace: true)
          end

          it 'subfieldtag # && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$\#$<', trace: true)
          end

          it 'subfieldtag # && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$\#$=', trace: true)
          end

          it 'subfieldtag # && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$\#$>', trace: true)
          end

          it 'subfieldtag # && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$\#$?', trace: true)
          end

          it 'subfieldtag # && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$\#$[', trace: true)
          end

          it 'subfieldtag # && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$\#$\\', trace: true)
          end

          it 'subfieldtag # && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$\#$]', trace: true)
          end

          it 'subfieldtag # && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$\#$^', trace: true)
          end

          it 'subfieldtag # && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$\#$_', trace: true)
          end

          it 'subfieldtag # && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$\#$`', trace: true)
          end

          it 'subfieldtag # && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$\#${', trace: true)
          end

          it 'subfieldtag # && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$\#$}', trace: true)
          end

          it 'subfieldtag # && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$\#$~', trace: true)
          end

          it 'subfieldtag $ && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$$$a', trace: true)
          end

          it 'subfieldtag $ && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$$$z', trace: true)
          end

          it 'subfieldtag $ && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$$$0', trace: true)
          end

          it 'subfieldtag $ && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$$$9', trace: true)
          end

          it 'subfieldtag $ && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$$$!', trace: true)
          end

          it 'subfieldtag $ && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$$$#', trace: true)
          end

          it 'subfieldtag $ && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$$$$', trace: true)
          end

          it 'subfieldtag $ && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$$$%', trace: true)
          end

          it 'subfieldtag $ && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$$$&', trace: true)
          end

          it "subfieldtag $ && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$$$'", trace: true)
          end

          it 'subfieldtag $ && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$$$(', trace: true)
          end

          it 'subfieldtag $ && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$$$)', trace: true)
          end

          it 'subfieldtag $ && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$$$*', trace: true)
          end

          it 'subfieldtag $ && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$$$+', trace: true)
          end

          it 'subfieldtag $ && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$$$,', trace: true)
          end

          it 'subfieldtag $ && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$$$-', trace: true)
          end

          it 'subfieldtag $ && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$$$.', trace: true)
          end

          it 'subfieldtag $ && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$$$/', trace: true)
          end

          it 'subfieldtag $ && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$$$:', trace: true)
          end

          it 'subfieldtag $ && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$$$;', trace: true)
          end

          it 'subfieldtag $ && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$$$<', trace: true)
          end

          it 'subfieldtag $ && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$$$=', trace: true)
          end

          it 'subfieldtag $ && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$$$>', trace: true)
          end

          it 'subfieldtag $ && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$$$?', trace: true)
          end

          it 'subfieldtag $ && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$$$[', trace: true)
          end

          it 'subfieldtag $ && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$$$\\', trace: true)
          end

          it 'subfieldtag $ && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$$$]', trace: true)
          end

          it 'subfieldtag $ && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$$$^', trace: true)
          end

          it 'subfieldtag $ && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$$$_', trace: true)
          end

          it 'subfieldtag $ && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$$$`', trace: true)
          end

          it 'subfieldtag $ && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$$${', trace: true)
          end

          it 'subfieldtag $ && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$$$}', trace: true)
          end

          it 'subfieldtag $ && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$$$~', trace: true)
          end

          it 'subfieldtag % && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$%$a', trace: true)
          end

          it 'subfieldtag % && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$%$z', trace: true)
          end

          it 'subfieldtag % && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$%$0', trace: true)
          end

          it 'subfieldtag % && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$%$9', trace: true)
          end

          it 'subfieldtag % && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$%$!', trace: true)
          end

          it 'subfieldtag % && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$%$#', trace: true)
          end

          it 'subfieldtag % && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$%$$', trace: true)
          end

          it 'subfieldtag % && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$%$%', trace: true)
          end

          it 'subfieldtag % && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$%$&', trace: true)
          end

          it "subfieldtag % && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$%$'", trace: true)
          end

          it 'subfieldtag % && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$%$(', trace: true)
          end

          it 'subfieldtag % && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$%$)', trace: true)
          end

          it 'subfieldtag % && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$%$*', trace: true)
          end

          it 'subfieldtag % && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$%$+', trace: true)
          end

          it 'subfieldtag % && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$%$,', trace: true)
          end

          it 'subfieldtag % && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$%$-', trace: true)
          end

          it 'subfieldtag % && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$%$.', trace: true)
          end

          it 'subfieldtag % && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$%$/', trace: true)
          end

          it 'subfieldtag % && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$%$:', trace: true)
          end

          it 'subfieldtag % && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$%$;', trace: true)
          end

          it 'subfieldtag % && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$%$<', trace: true)
          end

          it 'subfieldtag % && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$%$=', trace: true)
          end

          it 'subfieldtag % && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$%$>', trace: true)
          end

          it 'subfieldtag % && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$%$?', trace: true)
          end

          it 'subfieldtag % && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$%$[', trace: true)
          end

          it 'subfieldtag % && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$%$\\', trace: true)
          end

          it 'subfieldtag % && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$%$]', trace: true)
          end

          it 'subfieldtag % && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$%$^', trace: true)
          end

          it 'subfieldtag % && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$%$_', trace: true)
          end

          it 'subfieldtag % && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$%$`', trace: true)
          end

          it 'subfieldtag % && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$%${', trace: true)
          end

          it 'subfieldtag % && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$%$}', trace: true)
          end

          it 'subfieldtag % && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$%$~', trace: true)
          end

          it 'subfieldtag & && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$&$a', trace: true)
          end

          it 'subfieldtag & && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$&$z', trace: true)
          end

          it 'subfieldtag & && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$&$0', trace: true)
          end

          it 'subfieldtag & && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$&$9', trace: true)
          end

          it 'subfieldtag & && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$&$!', trace: true)
          end

          it 'subfieldtag & && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$&$#', trace: true)
          end

          it 'subfieldtag & && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$&$$', trace: true)
          end

          it 'subfieldtag & && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$&$%', trace: true)
          end

          it 'subfieldtag & && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$&$&', trace: true)
          end

          it "subfieldtag & && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$&$'", trace: true)
          end

          it 'subfieldtag & && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$&$(', trace: true)
          end

          it 'subfieldtag & && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$&$)', trace: true)
          end

          it 'subfieldtag & && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$&$*', trace: true)
          end

          it 'subfieldtag & && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$&$+', trace: true)
          end

          it 'subfieldtag & && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$&$,', trace: true)
          end

          it 'subfieldtag & && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$&$-', trace: true)
          end

          it 'subfieldtag & && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$&$.', trace: true)
          end

          it 'subfieldtag & && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$&$/', trace: true)
          end

          it 'subfieldtag & && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$&$:', trace: true)
          end

          it 'subfieldtag & && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$&$;', trace: true)
          end

          it 'subfieldtag & && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$&$<', trace: true)
          end

          it 'subfieldtag & && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$&$=', trace: true)
          end

          it 'subfieldtag & && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$&$>', trace: true)
          end

          it 'subfieldtag & && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$&$?', trace: true)
          end

          it 'subfieldtag & && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$&$[', trace: true)
          end

          it 'subfieldtag & && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$&$\\', trace: true)
          end

          it 'subfieldtag & && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$&$]', trace: true)
          end

          it 'subfieldtag & && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$&$^', trace: true)
          end

          it 'subfieldtag & && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$&$_', trace: true)
          end

          it 'subfieldtag & && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$&$`', trace: true)
          end

          it 'subfieldtag & && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$&${', trace: true)
          end

          it 'subfieldtag & && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$&$}', trace: true)
          end

          it 'subfieldtag & && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$&$~', trace: true)
          end

          it "subfieldtag ' && lowercase alpha subfieldtag a" do
            expect(parser.marc_spec).to parse("...$'$a", trace: true)
          end

          it "subfieldtag ' && lowercase alpha subfieldtag z" do
            expect(parser.marc_spec).to parse("...$'$z", trace: true)
          end

          it "subfieldtag ' && digit subfieldtag 0" do
            expect(parser.marc_spec).to parse("...$'$0", trace: true)
          end

          it "subfieldtag ' && digit subfieldtag 9" do
            expect(parser.marc_spec).to parse("...$'$9", trace: true)
          end

          it "subfieldtag ' && subfieldtag !" do
            expect(parser.marc_spec).to parse("...$'$!", trace: true)
          end

          it "subfieldtag ' && subfieldtag #" do
            expect(parser.marc_spec).to parse("...$'$#", trace: true)
          end

          it "subfieldtag ' && subfieldtag $" do
            expect(parser.marc_spec).to parse("...$'$$", trace: true)
          end

          it "subfieldtag ' && subfieldtag %" do
            expect(parser.marc_spec).to parse("...$'$%", trace: true)
          end

          it "subfieldtag ' && subfieldtag &" do
            expect(parser.marc_spec).to parse("...$'$&", trace: true)
          end

          it "subfieldtag ' && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$'$'", trace: true)
          end

          it "subfieldtag ' && subfieldtag (" do
            expect(parser.marc_spec).to parse("...$'$(", trace: true)
          end

          it "subfieldtag ' && subfieldtag )" do
            expect(parser.marc_spec).to parse("...$'$)", trace: true)
          end

          it "subfieldtag ' && subfieldtag *" do
            expect(parser.marc_spec).to parse("...$'$*", trace: true)
          end

          it "subfieldtag ' && subfieldtag +" do
            expect(parser.marc_spec).to parse("...$'$+", trace: true)
          end

          it "subfieldtag ' && subfieldtag ," do
            expect(parser.marc_spec).to parse("...$'$,", trace: true)
          end

          it "subfieldtag ' && subfieldtag -" do
            expect(parser.marc_spec).to parse("...$'$-", trace: true)
          end

          it "subfieldtag ' && subfieldtag ." do
            expect(parser.marc_spec).to parse("...$'$.", trace: true)
          end

          it "subfieldtag ' && subfieldtag /" do
            expect(parser.marc_spec).to parse("...$'$/", trace: true)
          end

          it "subfieldtag ' && subfieldtag :" do
            expect(parser.marc_spec).to parse("...$'$:", trace: true)
          end

          it "subfieldtag ' && subfieldtag ;" do
            expect(parser.marc_spec).to parse("...$'$;", trace: true)
          end

          it "subfieldtag ' && subfieldtag <" do
            expect(parser.marc_spec).to parse("...$'$<", trace: true)
          end

          it "subfieldtag ' && subfieldtag =" do
            expect(parser.marc_spec).to parse("...$'$=", trace: true)
          end

          it "subfieldtag ' && subfieldtag >" do
            expect(parser.marc_spec).to parse("...$'$>", trace: true)
          end

          it "subfieldtag ' && subfieldtag ?" do
            expect(parser.marc_spec).to parse("...$'$?", trace: true)
          end

          it "subfieldtag ' && subfieldtag [" do
            expect(parser.marc_spec).to parse("...$'$[", trace: true)
          end

          it "subfieldtag ' && subfieldtag \\" do
            expect(parser.marc_spec).to parse("...$'$\\", trace: true)
          end

          it "subfieldtag ' && subfieldtag ]" do
            expect(parser.marc_spec).to parse("...$'$]", trace: true)
          end

          it "subfieldtag ' && subfieldtag ^" do
            expect(parser.marc_spec).to parse("...$'$^", trace: true)
          end

          it "subfieldtag ' && subfieldtag _" do
            expect(parser.marc_spec).to parse("...$'$_", trace: true)
          end

          it "subfieldtag ' && subfieldtag `" do
            expect(parser.marc_spec).to parse("...$'$`", trace: true)
          end

          it "subfieldtag ' && subfieldtag {" do
            expect(parser.marc_spec).to parse("...$'${", trace: true)
          end

          it "subfieldtag ' && subfieldtag }" do
            expect(parser.marc_spec).to parse("...$'$}", trace: true)
          end

          it "subfieldtag ' && subfieldtag ~" do
            expect(parser.marc_spec).to parse("...$'$~", trace: true)
          end

          it 'subfieldtag ( && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$($a', trace: true)
          end

          it 'subfieldtag ( && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$($z', trace: true)
          end

          it 'subfieldtag ( && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$($0', trace: true)
          end

          it 'subfieldtag ( && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$($9', trace: true)
          end

          it 'subfieldtag ( && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$($!', trace: true)
          end

          it 'subfieldtag ( && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$($#', trace: true)
          end

          it 'subfieldtag ( && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$($$', trace: true)
          end

          it 'subfieldtag ( && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$($%', trace: true)
          end

          it 'subfieldtag ( && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$($&', trace: true)
          end

          it "subfieldtag ( && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$($'", trace: true)
          end

          it 'subfieldtag ( && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$($(', trace: true)
          end

          it 'subfieldtag ( && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$($)', trace: true)
          end

          it 'subfieldtag ( && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$($*', trace: true)
          end

          it 'subfieldtag ( && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$($+', trace: true)
          end

          it 'subfieldtag ( && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$($,', trace: true)
          end

          it 'subfieldtag ( && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$($-', trace: true)
          end

          it 'subfieldtag ( && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$($.', trace: true)
          end

          it 'subfieldtag ( && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$($/', trace: true)
          end

          it 'subfieldtag ( && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$($:', trace: true)
          end

          it 'subfieldtag ( && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$($;', trace: true)
          end

          it 'subfieldtag ( && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$($<', trace: true)
          end

          it 'subfieldtag ( && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$($=', trace: true)
          end

          it 'subfieldtag ( && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$($>', trace: true)
          end

          it 'subfieldtag ( && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$($?', trace: true)
          end

          it 'subfieldtag ( && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$($[', trace: true)
          end

          it 'subfieldtag ( && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$($\\', trace: true)
          end

          it 'subfieldtag ( && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$($]', trace: true)
          end

          it 'subfieldtag ( && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$($^', trace: true)
          end

          it 'subfieldtag ( && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$($_', trace: true)
          end

          it 'subfieldtag ( && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$($`', trace: true)
          end

          it 'subfieldtag ( && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$(${', trace: true)
          end

          it 'subfieldtag ( && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$($}', trace: true)
          end

          it 'subfieldtag ( && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$($~', trace: true)
          end

          it 'subfieldtag ) && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$)$a', trace: true)
          end

          it 'subfieldtag ) && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$)$z', trace: true)
          end

          it 'subfieldtag ) && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$)$0', trace: true)
          end

          it 'subfieldtag ) && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$)$9', trace: true)
          end

          it 'subfieldtag ) && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$)$!', trace: true)
          end

          it 'subfieldtag ) && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$)$#', trace: true)
          end

          it 'subfieldtag ) && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$)$$', trace: true)
          end

          it 'subfieldtag ) && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$)$%', trace: true)
          end

          it 'subfieldtag ) && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$)$&', trace: true)
          end

          it "subfieldtag ) && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$)$'", trace: true)
          end

          it 'subfieldtag ) && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$)$(', trace: true)
          end

          it 'subfieldtag ) && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$)$)', trace: true)
          end

          it 'subfieldtag ) && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$)$*', trace: true)
          end

          it 'subfieldtag ) && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$)$+', trace: true)
          end

          it 'subfieldtag ) && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$)$,', trace: true)
          end

          it 'subfieldtag ) && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$)$-', trace: true)
          end

          it 'subfieldtag ) && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$)$.', trace: true)
          end

          it 'subfieldtag ) && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$)$/', trace: true)
          end

          it 'subfieldtag ) && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$)$:', trace: true)
          end

          it 'subfieldtag ) && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$)$;', trace: true)
          end

          it 'subfieldtag ) && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$)$<', trace: true)
          end

          it 'subfieldtag ) && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$)$=', trace: true)
          end

          it 'subfieldtag ) && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$)$>', trace: true)
          end

          it 'subfieldtag ) && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$)$?', trace: true)
          end

          it 'subfieldtag ) && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$)$[', trace: true)
          end

          it 'subfieldtag ) && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$)$\\', trace: true)
          end

          it 'subfieldtag ) && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$)$]', trace: true)
          end

          it 'subfieldtag ) && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$)$^', trace: true)
          end

          it 'subfieldtag ) && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$)$_', trace: true)
          end

          it 'subfieldtag ) && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$)$`', trace: true)
          end

          it 'subfieldtag ) && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$)${', trace: true)
          end

          it 'subfieldtag ) && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$)$}', trace: true)
          end

          it 'subfieldtag ) && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$)$~', trace: true)
          end

          it 'subfieldtag * && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$*$a', trace: true)
          end

          it 'subfieldtag * && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$*$z', trace: true)
          end

          it 'subfieldtag * && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$*$0', trace: true)
          end

          it 'subfieldtag * && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$*$9', trace: true)
          end

          it 'subfieldtag * && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$*$!', trace: true)
          end

          it 'subfieldtag * && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$*$#', trace: true)
          end

          it 'subfieldtag * && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$*$$', trace: true)
          end

          it 'subfieldtag * && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$*$%', trace: true)
          end

          it 'subfieldtag * && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$*$&', trace: true)
          end

          it "subfieldtag * && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$*$'", trace: true)
          end

          it 'subfieldtag * && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$*$(', trace: true)
          end

          it 'subfieldtag * && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$*$)', trace: true)
          end

          it 'subfieldtag * && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$*$*', trace: true)
          end

          it 'subfieldtag * && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$*$+', trace: true)
          end

          it 'subfieldtag * && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$*$,', trace: true)
          end

          it 'subfieldtag * && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$*$-', trace: true)
          end

          it 'subfieldtag * && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$*$.', trace: true)
          end

          it 'subfieldtag * && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$*$/', trace: true)
          end

          it 'subfieldtag * && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$*$:', trace: true)
          end

          it 'subfieldtag * && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$*$;', trace: true)
          end

          it 'subfieldtag * && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$*$<', trace: true)
          end

          it 'subfieldtag * && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$*$=', trace: true)
          end

          it 'subfieldtag * && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$*$>', trace: true)
          end

          it 'subfieldtag * && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$*$?', trace: true)
          end

          it 'subfieldtag * && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$*$[', trace: true)
          end

          it 'subfieldtag * && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$*$\\', trace: true)
          end

          it 'subfieldtag * && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$*$]', trace: true)
          end

          it 'subfieldtag * && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$*$^', trace: true)
          end

          it 'subfieldtag * && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$*$_', trace: true)
          end

          it 'subfieldtag * && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$*$`', trace: true)
          end

          it 'subfieldtag * && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$*${', trace: true)
          end

          it 'subfieldtag * && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$*$}', trace: true)
          end

          it 'subfieldtag * && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$*$~', trace: true)
          end

          it 'subfieldtag + && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$+$a', trace: true)
          end

          it 'subfieldtag + && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$+$z', trace: true)
          end

          it 'subfieldtag + && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$+$0', trace: true)
          end

          it 'subfieldtag + && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$+$9', trace: true)
          end

          it 'subfieldtag + && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$+$!', trace: true)
          end

          it 'subfieldtag + && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$+$#', trace: true)
          end

          it 'subfieldtag + && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$+$$', trace: true)
          end

          it 'subfieldtag + && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$+$%', trace: true)
          end

          it 'subfieldtag + && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$+$&', trace: true)
          end

          it "subfieldtag + && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$+$'", trace: true)
          end

          it 'subfieldtag + && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$+$(', trace: true)
          end

          it 'subfieldtag + && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$+$)', trace: true)
          end

          it 'subfieldtag + && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$+$*', trace: true)
          end

          it 'subfieldtag + && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$+$+', trace: true)
          end

          it 'subfieldtag + && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$+$,', trace: true)
          end

          it 'subfieldtag + && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$+$-', trace: true)
          end

          it 'subfieldtag + && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$+$.', trace: true)
          end

          it 'subfieldtag + && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$+$/', trace: true)
          end

          it 'subfieldtag + && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$+$:', trace: true)
          end

          it 'subfieldtag + && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$+$;', trace: true)
          end

          it 'subfieldtag + && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$+$<', trace: true)
          end

          it 'subfieldtag + && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$+$=', trace: true)
          end

          it 'subfieldtag + && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$+$>', trace: true)
          end

          it 'subfieldtag + && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$+$?', trace: true)
          end

          it 'subfieldtag + && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$+$[', trace: true)
          end

          it 'subfieldtag + && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$+$\\', trace: true)
          end

          it 'subfieldtag + && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$+$]', trace: true)
          end

          it 'subfieldtag + && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$+$^', trace: true)
          end

          it 'subfieldtag + && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$+$_', trace: true)
          end

          it 'subfieldtag + && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$+$`', trace: true)
          end

          it 'subfieldtag + && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$+${', trace: true)
          end

          it 'subfieldtag + && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$+$}', trace: true)
          end

          it 'subfieldtag + && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$+$~', trace: true)
          end

          it 'subfieldtag , && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$,$a', trace: true)
          end

          it 'subfieldtag , && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$,$z', trace: true)
          end

          it 'subfieldtag , && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$,$0', trace: true)
          end

          it 'subfieldtag , && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$,$9', trace: true)
          end

          it 'subfieldtag , && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$,$!', trace: true)
          end

          it 'subfieldtag , && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$,$#', trace: true)
          end

          it 'subfieldtag , && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$,$$', trace: true)
          end

          it 'subfieldtag , && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$,$%', trace: true)
          end

          it 'subfieldtag , && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$,$&', trace: true)
          end

          it "subfieldtag , && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$,$'", trace: true)
          end

          it 'subfieldtag , && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$,$(', trace: true)
          end

          it 'subfieldtag , && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$,$)', trace: true)
          end

          it 'subfieldtag , && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$,$*', trace: true)
          end

          it 'subfieldtag , && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$,$+', trace: true)
          end

          it 'subfieldtag , && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$,$,', trace: true)
          end

          it 'subfieldtag , && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$,$-', trace: true)
          end

          it 'subfieldtag , && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$,$.', trace: true)
          end

          it 'subfieldtag , && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$,$/', trace: true)
          end

          it 'subfieldtag , && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$,$:', trace: true)
          end

          it 'subfieldtag , && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$,$;', trace: true)
          end

          it 'subfieldtag , && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$,$<', trace: true)
          end

          it 'subfieldtag , && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$,$=', trace: true)
          end

          it 'subfieldtag , && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$,$>', trace: true)
          end

          it 'subfieldtag , && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$,$?', trace: true)
          end

          it 'subfieldtag , && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$,$[', trace: true)
          end

          it 'subfieldtag , && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$,$\\', trace: true)
          end

          it 'subfieldtag , && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$,$]', trace: true)
          end

          it 'subfieldtag , && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$,$^', trace: true)
          end

          it 'subfieldtag , && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$,$_', trace: true)
          end

          it 'subfieldtag , && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$,$`', trace: true)
          end

          it 'subfieldtag , && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$,${', trace: true)
          end

          it 'subfieldtag , && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$,$}', trace: true)
          end

          it 'subfieldtag , && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$,$~', trace: true)
          end

          it 'subfieldtag - && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$-$a', trace: true)
          end

          it 'subfieldtag - && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$-$z', trace: true)
          end

          it 'subfieldtag - && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$-$0', trace: true)
          end

          it 'subfieldtag - && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$-$9', trace: true)
          end

          it 'subfieldtag - && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$-$!', trace: true)
          end

          it 'subfieldtag - && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$-$#', trace: true)
          end

          it 'subfieldtag - && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$-$$', trace: true)
          end

          it 'subfieldtag - && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$-$%', trace: true)
          end

          it 'subfieldtag - && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$-$&', trace: true)
          end

          it "subfieldtag - && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$-$'", trace: true)
          end

          it 'subfieldtag - && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$-$(', trace: true)
          end

          it 'subfieldtag - && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$-$)', trace: true)
          end

          it 'subfieldtag - && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$-$*', trace: true)
          end

          it 'subfieldtag - && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$-$+', trace: true)
          end

          it 'subfieldtag - && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$-$,', trace: true)
          end

          it 'subfieldtag - && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$-$-', trace: true)
          end

          it 'subfieldtag - && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$-$.', trace: true)
          end

          it 'subfieldtag - && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$-$/', trace: true)
          end

          it 'subfieldtag - && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$-$:', trace: true)
          end

          it 'subfieldtag - && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$-$;', trace: true)
          end

          it 'subfieldtag - && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$-$<', trace: true)
          end

          it 'subfieldtag - && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$-$=', trace: true)
          end

          it 'subfieldtag - && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$-$>', trace: true)
          end

          it 'subfieldtag - && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$-$?', trace: true)
          end

          it 'subfieldtag - && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$-$[', trace: true)
          end

          it 'subfieldtag - && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$-$\\', trace: true)
          end

          it 'subfieldtag - && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$-$]', trace: true)
          end

          it 'subfieldtag - && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$-$^', trace: true)
          end

          it 'subfieldtag - && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$-$_', trace: true)
          end

          it 'subfieldtag - && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$-$`', trace: true)
          end

          it 'subfieldtag - && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$-${', trace: true)
          end

          it 'subfieldtag - && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$-$}', trace: true)
          end

          it 'subfieldtag - && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$-$~', trace: true)
          end

          it 'subfieldtag . && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$.$a', trace: true)
          end

          it 'subfieldtag . && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$.$z', trace: true)
          end

          it 'subfieldtag . && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$.$0', trace: true)
          end

          it 'subfieldtag . && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$.$9', trace: true)
          end

          it 'subfieldtag . && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$.$!', trace: true)
          end

          it 'subfieldtag . && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$.$#', trace: true)
          end

          it 'subfieldtag . && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$.$$', trace: true)
          end

          it 'subfieldtag . && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$.$%', trace: true)
          end

          it 'subfieldtag . && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$.$&', trace: true)
          end

          it "subfieldtag . && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$.$'", trace: true)
          end

          it 'subfieldtag . && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$.$(', trace: true)
          end

          it 'subfieldtag . && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$.$)', trace: true)
          end

          it 'subfieldtag . && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$.$*', trace: true)
          end

          it 'subfieldtag . && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$.$+', trace: true)
          end

          it 'subfieldtag . && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$.$,', trace: true)
          end

          it 'subfieldtag . && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$.$-', trace: true)
          end

          it 'subfieldtag . && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$.$.', trace: true)
          end

          it 'subfieldtag . && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$.$/', trace: true)
          end

          it 'subfieldtag . && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$.$:', trace: true)
          end

          it 'subfieldtag . && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$.$;', trace: true)
          end

          it 'subfieldtag . && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$.$<', trace: true)
          end

          it 'subfieldtag . && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$.$=', trace: true)
          end

          it 'subfieldtag . && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$.$>', trace: true)
          end

          it 'subfieldtag . && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$.$?', trace: true)
          end

          it 'subfieldtag . && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$.$[', trace: true)
          end

          it 'subfieldtag . && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$.$\\', trace: true)
          end

          it 'subfieldtag . && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$.$]', trace: true)
          end

          it 'subfieldtag . && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$.$^', trace: true)
          end

          it 'subfieldtag . && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$.$_', trace: true)
          end

          it 'subfieldtag . && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$.$`', trace: true)
          end

          it 'subfieldtag . && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$.${', trace: true)
          end

          it 'subfieldtag . && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$.$}', trace: true)
          end

          it 'subfieldtag . && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$.$~', trace: true)
          end

          it 'subfieldtag / && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$/$a', trace: true)
          end

          it 'subfieldtag / && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$/$z', trace: true)
          end

          it 'subfieldtag / && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$/$0', trace: true)
          end

          it 'subfieldtag / && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$/$9', trace: true)
          end

          it 'subfieldtag / && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$/$!', trace: true)
          end

          it 'subfieldtag / && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$/$#', trace: true)
          end

          it 'subfieldtag / && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$/$$', trace: true)
          end

          it 'subfieldtag / && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$/$%', trace: true)
          end

          it 'subfieldtag / && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$/$&', trace: true)
          end

          it "subfieldtag / && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$/$'", trace: true)
          end

          it 'subfieldtag / && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$/$(', trace: true)
          end

          it 'subfieldtag / && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$/$)', trace: true)
          end

          it 'subfieldtag / && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$/$*', trace: true)
          end

          it 'subfieldtag / && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$/$+', trace: true)
          end

          it 'subfieldtag / && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$/$,', trace: true)
          end

          it 'subfieldtag / && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$/$-', trace: true)
          end

          it 'subfieldtag / && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$/$.', trace: true)
          end

          it 'subfieldtag / && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$/$/', trace: true)
          end

          it 'subfieldtag / && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$/$:', trace: true)
          end

          it 'subfieldtag / && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$/$;', trace: true)
          end

          it 'subfieldtag / && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$/$<', trace: true)
          end

          it 'subfieldtag / && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$/$=', trace: true)
          end

          it 'subfieldtag / && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$/$>', trace: true)
          end

          it 'subfieldtag / && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$/$?', trace: true)
          end

          it 'subfieldtag / && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$/$[', trace: true)
          end

          it 'subfieldtag / && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$/$\\', trace: true)
          end

          it 'subfieldtag / && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$/$]', trace: true)
          end

          it 'subfieldtag / && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$/$^', trace: true)
          end

          it 'subfieldtag / && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$/$_', trace: true)
          end

          it 'subfieldtag / && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$/$`', trace: true)
          end

          it 'subfieldtag / && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$/${', trace: true)
          end

          it 'subfieldtag / && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$/$}', trace: true)
          end

          it 'subfieldtag / && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$/$~', trace: true)
          end

          it 'subfieldtag : && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$:$a', trace: true)
          end

          it 'subfieldtag : && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$:$z', trace: true)
          end

          it 'subfieldtag : && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$:$0', trace: true)
          end

          it 'subfieldtag : && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$:$9', trace: true)
          end

          it 'subfieldtag : && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$:$!', trace: true)
          end

          it 'subfieldtag : && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$:$#', trace: true)
          end

          it 'subfieldtag : && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$:$$', trace: true)
          end

          it 'subfieldtag : && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$:$%', trace: true)
          end

          it 'subfieldtag : && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$:$&', trace: true)
          end

          it "subfieldtag : && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$:$'", trace: true)
          end

          it 'subfieldtag : && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$:$(', trace: true)
          end

          it 'subfieldtag : && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$:$)', trace: true)
          end

          it 'subfieldtag : && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$:$*', trace: true)
          end

          it 'subfieldtag : && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$:$+', trace: true)
          end

          it 'subfieldtag : && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$:$,', trace: true)
          end

          it 'subfieldtag : && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$:$-', trace: true)
          end

          it 'subfieldtag : && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$:$.', trace: true)
          end

          it 'subfieldtag : && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$:$/', trace: true)
          end

          it 'subfieldtag : && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$:$:', trace: true)
          end

          it 'subfieldtag : && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$:$;', trace: true)
          end

          it 'subfieldtag : && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$:$<', trace: true)
          end

          it 'subfieldtag : && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$:$=', trace: true)
          end

          it 'subfieldtag : && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$:$>', trace: true)
          end

          it 'subfieldtag : && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$:$?', trace: true)
          end

          it 'subfieldtag : && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$:$[', trace: true)
          end

          it 'subfieldtag : && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$:$\\', trace: true)
          end

          it 'subfieldtag : && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$:$]', trace: true)
          end

          it 'subfieldtag : && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$:$^', trace: true)
          end

          it 'subfieldtag : && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$:$_', trace: true)
          end

          it 'subfieldtag : && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$:$`', trace: true)
          end

          it 'subfieldtag : && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$:${', trace: true)
          end

          it 'subfieldtag : && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$:$}', trace: true)
          end

          it 'subfieldtag : && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$:$~', trace: true)
          end

          it 'subfieldtag ; && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$;$a', trace: true)
          end

          it 'subfieldtag ; && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$;$z', trace: true)
          end

          it 'subfieldtag ; && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$;$0', trace: true)
          end

          it 'subfieldtag ; && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$;$9', trace: true)
          end

          it 'subfieldtag ; && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$;$!', trace: true)
          end

          it 'subfieldtag ; && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$;$#', trace: true)
          end

          it 'subfieldtag ; && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$;$$', trace: true)
          end

          it 'subfieldtag ; && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$;$%', trace: true)
          end

          it 'subfieldtag ; && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$;$&', trace: true)
          end

          it "subfieldtag ; && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$;$'", trace: true)
          end

          it 'subfieldtag ; && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$;$(', trace: true)
          end

          it 'subfieldtag ; && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$;$)', trace: true)
          end

          it 'subfieldtag ; && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$;$*', trace: true)
          end

          it 'subfieldtag ; && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$;$+', trace: true)
          end

          it 'subfieldtag ; && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$;$,', trace: true)
          end

          it 'subfieldtag ; && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$;$-', trace: true)
          end

          it 'subfieldtag ; && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$;$.', trace: true)
          end

          it 'subfieldtag ; && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$;$/', trace: true)
          end

          it 'subfieldtag ; && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$;$:', trace: true)
          end

          it 'subfieldtag ; && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$;$;', trace: true)
          end

          it 'subfieldtag ; && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$;$<', trace: true)
          end

          it 'subfieldtag ; && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$;$=', trace: true)
          end

          it 'subfieldtag ; && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$;$>', trace: true)
          end

          it 'subfieldtag ; && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$;$?', trace: true)
          end

          it 'subfieldtag ; && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$;$[', trace: true)
          end

          it 'subfieldtag ; && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$;$\\', trace: true)
          end

          it 'subfieldtag ; && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$;$]', trace: true)
          end

          it 'subfieldtag ; && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$;$^', trace: true)
          end

          it 'subfieldtag ; && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$;$_', trace: true)
          end

          it 'subfieldtag ; && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$;$`', trace: true)
          end

          it 'subfieldtag ; && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$;${', trace: true)
          end

          it 'subfieldtag ; && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$;$}', trace: true)
          end

          it 'subfieldtag ; && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$;$~', trace: true)
          end

          it 'subfieldtag < && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$<$a', trace: true)
          end

          it 'subfieldtag < && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$<$z', trace: true)
          end

          it 'subfieldtag < && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$<$0', trace: true)
          end

          it 'subfieldtag < && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$<$9', trace: true)
          end

          it 'subfieldtag < && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$<$!', trace: true)
          end

          it 'subfieldtag < && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$<$#', trace: true)
          end

          it 'subfieldtag < && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$<$$', trace: true)
          end

          it 'subfieldtag < && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$<$%', trace: true)
          end

          it 'subfieldtag < && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$<$&', trace: true)
          end

          it "subfieldtag < && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$<$'", trace: true)
          end

          it 'subfieldtag < && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$<$(', trace: true)
          end

          it 'subfieldtag < && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$<$)', trace: true)
          end

          it 'subfieldtag < && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$<$*', trace: true)
          end

          it 'subfieldtag < && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$<$+', trace: true)
          end

          it 'subfieldtag < && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$<$,', trace: true)
          end

          it 'subfieldtag < && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$<$-', trace: true)
          end

          it 'subfieldtag < && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$<$.', trace: true)
          end

          it 'subfieldtag < && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$<$/', trace: true)
          end

          it 'subfieldtag < && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$<$:', trace: true)
          end

          it 'subfieldtag < && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$<$;', trace: true)
          end

          it 'subfieldtag < && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$<$<', trace: true)
          end

          it 'subfieldtag < && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$<$=', trace: true)
          end

          it 'subfieldtag < && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$<$>', trace: true)
          end

          it 'subfieldtag < && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$<$?', trace: true)
          end

          it 'subfieldtag < && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$<$[', trace: true)
          end

          it 'subfieldtag < && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$<$\\', trace: true)
          end

          it 'subfieldtag < && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$<$]', trace: true)
          end

          it 'subfieldtag < && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$<$^', trace: true)
          end

          it 'subfieldtag < && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$<$_', trace: true)
          end

          it 'subfieldtag < && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$<$`', trace: true)
          end

          it 'subfieldtag < && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$<${', trace: true)
          end

          it 'subfieldtag < && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$<$}', trace: true)
          end

          it 'subfieldtag < && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$<$~', trace: true)
          end

          it 'subfieldtag = && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$=$a', trace: true)
          end

          it 'subfieldtag = && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$=$z', trace: true)
          end

          it 'subfieldtag = && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$=$0', trace: true)
          end

          it 'subfieldtag = && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$=$9', trace: true)
          end

          it 'subfieldtag = && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$=$!', trace: true)
          end

          it 'subfieldtag = && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$=$#', trace: true)
          end

          it 'subfieldtag = && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$=$$', trace: true)
          end

          it 'subfieldtag = && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$=$%', trace: true)
          end

          it 'subfieldtag = && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$=$&', trace: true)
          end

          it "subfieldtag = && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$=$'", trace: true)
          end

          it 'subfieldtag = && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$=$(', trace: true)
          end

          it 'subfieldtag = && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$=$)', trace: true)
          end

          it 'subfieldtag = && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$=$*', trace: true)
          end

          it 'subfieldtag = && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$=$+', trace: true)
          end

          it 'subfieldtag = && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$=$,', trace: true)
          end

          it 'subfieldtag = && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$=$-', trace: true)
          end

          it 'subfieldtag = && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$=$.', trace: true)
          end

          it 'subfieldtag = && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$=$/', trace: true)
          end

          it 'subfieldtag = && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$=$:', trace: true)
          end

          it 'subfieldtag = && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$=$;', trace: true)
          end

          it 'subfieldtag = && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$=$<', trace: true)
          end

          it 'subfieldtag = && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$=$=', trace: true)
          end

          it 'subfieldtag = && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$=$>', trace: true)
          end

          it 'subfieldtag = && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$=$?', trace: true)
          end

          it 'subfieldtag = && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$=$[', trace: true)
          end

          it 'subfieldtag = && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$=$\\', trace: true)
          end

          it 'subfieldtag = && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$=$]', trace: true)
          end

          it 'subfieldtag = && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$=$^', trace: true)
          end

          it 'subfieldtag = && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$=$_', trace: true)
          end

          it 'subfieldtag = && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$=$`', trace: true)
          end

          it 'subfieldtag = && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$=${', trace: true)
          end

          it 'subfieldtag = && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$=$}', trace: true)
          end

          it 'subfieldtag = && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$=$~', trace: true)
          end

          it 'subfieldtag > && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$>$a', trace: true)
          end

          it 'subfieldtag > && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$>$z', trace: true)
          end

          it 'subfieldtag > && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$>$0', trace: true)
          end

          it 'subfieldtag > && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$>$9', trace: true)
          end

          it 'subfieldtag > && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$>$!', trace: true)
          end

          it 'subfieldtag > && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$>$#', trace: true)
          end

          it 'subfieldtag > && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$>$$', trace: true)
          end

          it 'subfieldtag > && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$>$%', trace: true)
          end

          it 'subfieldtag > && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$>$&', trace: true)
          end

          it "subfieldtag > && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$>$'", trace: true)
          end

          it 'subfieldtag > && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$>$(', trace: true)
          end

          it 'subfieldtag > && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$>$)', trace: true)
          end

          it 'subfieldtag > && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$>$*', trace: true)
          end

          it 'subfieldtag > && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$>$+', trace: true)
          end

          it 'subfieldtag > && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$>$,', trace: true)
          end

          it 'subfieldtag > && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$>$-', trace: true)
          end

          it 'subfieldtag > && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$>$.', trace: true)
          end

          it 'subfieldtag > && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$>$/', trace: true)
          end

          it 'subfieldtag > && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$>$:', trace: true)
          end

          it 'subfieldtag > && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$>$;', trace: true)
          end

          it 'subfieldtag > && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$>$<', trace: true)
          end

          it 'subfieldtag > && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$>$=', trace: true)
          end

          it 'subfieldtag > && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$>$>', trace: true)
          end

          it 'subfieldtag > && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$>$?', trace: true)
          end

          it 'subfieldtag > && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$>$[', trace: true)
          end

          it 'subfieldtag > && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$>$\\', trace: true)
          end

          it 'subfieldtag > && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$>$]', trace: true)
          end

          it 'subfieldtag > && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$>$^', trace: true)
          end

          it 'subfieldtag > && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$>$_', trace: true)
          end

          it 'subfieldtag > && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$>$`', trace: true)
          end

          it 'subfieldtag > && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$>${', trace: true)
          end

          it 'subfieldtag > && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$>$}', trace: true)
          end

          it 'subfieldtag > && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$>$~', trace: true)
          end

          it 'subfieldtag ? && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$?$a', trace: true)
          end

          it 'subfieldtag ? && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$?$z', trace: true)
          end

          it 'subfieldtag ? && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$?$0', trace: true)
          end

          it 'subfieldtag ? && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$?$9', trace: true)
          end

          it 'subfieldtag ? && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$?$!', trace: true)
          end

          it 'subfieldtag ? && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$?$#', trace: true)
          end

          it 'subfieldtag ? && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$?$$', trace: true)
          end

          it 'subfieldtag ? && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$?$%', trace: true)
          end

          it 'subfieldtag ? && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$?$&', trace: true)
          end

          it "subfieldtag ? && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$?$'", trace: true)
          end

          it 'subfieldtag ? && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$?$(', trace: true)
          end

          it 'subfieldtag ? && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$?$)', trace: true)
          end

          it 'subfieldtag ? && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$?$*', trace: true)
          end

          it 'subfieldtag ? && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$?$+', trace: true)
          end

          it 'subfieldtag ? && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$?$,', trace: true)
          end

          it 'subfieldtag ? && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$?$-', trace: true)
          end

          it 'subfieldtag ? && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$?$.', trace: true)
          end

          it 'subfieldtag ? && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$?$/', trace: true)
          end

          it 'subfieldtag ? && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$?$:', trace: true)
          end

          it 'subfieldtag ? && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$?$;', trace: true)
          end

          it 'subfieldtag ? && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$?$<', trace: true)
          end

          it 'subfieldtag ? && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$?$=', trace: true)
          end

          it 'subfieldtag ? && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$?$>', trace: true)
          end

          it 'subfieldtag ? && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$?$?', trace: true)
          end

          it 'subfieldtag ? && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$?$[', trace: true)
          end

          it 'subfieldtag ? && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$?$\\', trace: true)
          end

          it 'subfieldtag ? && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$?$]', trace: true)
          end

          it 'subfieldtag ? && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$?$^', trace: true)
          end

          it 'subfieldtag ? && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$?$_', trace: true)
          end

          it 'subfieldtag ? && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$?$`', trace: true)
          end

          it 'subfieldtag ? && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$?${', trace: true)
          end

          it 'subfieldtag ? && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$?$}', trace: true)
          end

          it 'subfieldtag ? && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$?$~', trace: true)
          end

          it 'subfieldtag [ && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$[$a', trace: true)
          end

          it 'subfieldtag [ && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$[$z', trace: true)
          end

          it 'subfieldtag [ && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$[$0', trace: true)
          end

          it 'subfieldtag [ && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$[$9', trace: true)
          end

          it 'subfieldtag [ && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$[$!', trace: true)
          end

          it 'subfieldtag [ && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$[$#', trace: true)
          end

          it 'subfieldtag [ && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$[$$', trace: true)
          end

          it 'subfieldtag [ && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$[$%', trace: true)
          end

          it 'subfieldtag [ && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$[$&', trace: true)
          end

          it "subfieldtag [ && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$[$'", trace: true)
          end

          it 'subfieldtag [ && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$[$(', trace: true)
          end

          it 'subfieldtag [ && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$[$)', trace: true)
          end

          it 'subfieldtag [ && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$[$*', trace: true)
          end

          it 'subfieldtag [ && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$[$+', trace: true)
          end

          it 'subfieldtag [ && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$[$,', trace: true)
          end

          it 'subfieldtag [ && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$[$-', trace: true)
          end

          it 'subfieldtag [ && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$[$.', trace: true)
          end

          it 'subfieldtag [ && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$[$/', trace: true)
          end

          it 'subfieldtag [ && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$[$:', trace: true)
          end

          it 'subfieldtag [ && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$[$;', trace: true)
          end

          it 'subfieldtag [ && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$[$<', trace: true)
          end

          it 'subfieldtag [ && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$[$=', trace: true)
          end

          it 'subfieldtag [ && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$[$>', trace: true)
          end

          it 'subfieldtag [ && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$[$?', trace: true)
          end

          it 'subfieldtag [ && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$[$[', trace: true)
          end

          it 'subfieldtag [ && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$[$\\', trace: true)
          end

          it 'subfieldtag [ && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$[$]', trace: true)
          end

          it 'subfieldtag [ && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$[$^', trace: true)
          end

          it 'subfieldtag [ && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$[$_', trace: true)
          end

          it 'subfieldtag [ && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$[$`', trace: true)
          end

          it 'subfieldtag [ && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$[${', trace: true)
          end

          it 'subfieldtag [ && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$[$}', trace: true)
          end

          it 'subfieldtag [ && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$[$~', trace: true)
          end

          it 'subfieldtag \\ && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$\\$a', trace: true)
          end

          it 'subfieldtag \\ && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$\\$z', trace: true)
          end

          it 'subfieldtag \\ && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$\\$0', trace: true)
          end

          it 'subfieldtag \\ && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$\\$9', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$\\$!', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$\\$#', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$\\$$', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$\\$%', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$\\$&', trace: true)
          end

          it "subfieldtag \\ && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$\\$'", trace: true)
          end

          it 'subfieldtag \\ && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$\\$(', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$\\$)', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$\\$*', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$\\$+', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$\\$,', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$\\$-', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$\\$.', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$\\$/', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$\\$:', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$\\$;', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$\\$<', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$\\$=', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$\\$>', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$\\$?', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$\\$[', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$\\$\\', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$\\$]', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$\\$^', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$\\$_', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$\\$`', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$\\${', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$\\$}', trace: true)
          end

          it 'subfieldtag \\ && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$\\$~', trace: true)
          end

          it 'subfieldtag ] && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$]$a', trace: true)
          end

          it 'subfieldtag ] && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$]$z', trace: true)
          end

          it 'subfieldtag ] && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$]$0', trace: true)
          end

          it 'subfieldtag ] && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$]$9', trace: true)
          end

          it 'subfieldtag ] && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$]$!', trace: true)
          end

          it 'subfieldtag ] && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$]$#', trace: true)
          end

          it 'subfieldtag ] && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$]$$', trace: true)
          end

          it 'subfieldtag ] && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$]$%', trace: true)
          end

          it 'subfieldtag ] && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$]$&', trace: true)
          end

          it "subfieldtag ] && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$]$'", trace: true)
          end

          it 'subfieldtag ] && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$]$(', trace: true)
          end

          it 'subfieldtag ] && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$]$)', trace: true)
          end

          it 'subfieldtag ] && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$]$*', trace: true)
          end

          it 'subfieldtag ] && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$]$+', trace: true)
          end

          it 'subfieldtag ] && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$]$,', trace: true)
          end

          it 'subfieldtag ] && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$]$-', trace: true)
          end

          it 'subfieldtag ] && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$]$.', trace: true)
          end

          it 'subfieldtag ] && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$]$/', trace: true)
          end

          it 'subfieldtag ] && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$]$:', trace: true)
          end

          it 'subfieldtag ] && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$]$;', trace: true)
          end

          it 'subfieldtag ] && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$]$<', trace: true)
          end

          it 'subfieldtag ] && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$]$=', trace: true)
          end

          it 'subfieldtag ] && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$]$>', trace: true)
          end

          it 'subfieldtag ] && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$]$?', trace: true)
          end

          it 'subfieldtag ] && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$]$[', trace: true)
          end

          it 'subfieldtag ] && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$]$\\', trace: true)
          end

          it 'subfieldtag ] && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$]$]', trace: true)
          end

          it 'subfieldtag ] && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$]$^', trace: true)
          end

          it 'subfieldtag ] && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$]$_', trace: true)
          end

          it 'subfieldtag ] && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$]$`', trace: true)
          end

          it 'subfieldtag ] && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$]${', trace: true)
          end

          it 'subfieldtag ] && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$]$}', trace: true)
          end

          it 'subfieldtag ] && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$]$~', trace: true)
          end

          it 'subfieldtag ^ && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$^$a', trace: true)
          end

          it 'subfieldtag ^ && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$^$z', trace: true)
          end

          it 'subfieldtag ^ && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$^$0', trace: true)
          end

          it 'subfieldtag ^ && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$^$9', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$^$!', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$^$#', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$^$$', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$^$%', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$^$&', trace: true)
          end

          it "subfieldtag ^ && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$^$'", trace: true)
          end

          it 'subfieldtag ^ && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$^$(', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$^$)', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$^$*', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$^$+', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$^$,', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$^$-', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$^$.', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$^$/', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$^$:', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$^$;', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$^$<', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$^$=', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$^$>', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$^$?', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$^$[', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$^$\\', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$^$]', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$^$^', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$^$_', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$^$`', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$^${', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$^$}', trace: true)
          end

          it 'subfieldtag ^ && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$^$~', trace: true)
          end

          it 'subfieldtag _ && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$_$a', trace: true)
          end

          it 'subfieldtag _ && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$_$z', trace: true)
          end

          it 'subfieldtag _ && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$_$0', trace: true)
          end

          it 'subfieldtag _ && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$_$9', trace: true)
          end

          it 'subfieldtag _ && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$_$!', trace: true)
          end

          it 'subfieldtag _ && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$_$#', trace: true)
          end

          it 'subfieldtag _ && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$_$$', trace: true)
          end

          it 'subfieldtag _ && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$_$%', trace: true)
          end

          it 'subfieldtag _ && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$_$&', trace: true)
          end

          it "subfieldtag _ && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$_$'", trace: true)
          end

          it 'subfieldtag _ && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$_$(', trace: true)
          end

          it 'subfieldtag _ && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$_$)', trace: true)
          end

          it 'subfieldtag _ && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$_$*', trace: true)
          end

          it 'subfieldtag _ && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$_$+', trace: true)
          end

          it 'subfieldtag _ && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$_$,', trace: true)
          end

          it 'subfieldtag _ && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$_$-', trace: true)
          end

          it 'subfieldtag _ && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$_$.', trace: true)
          end

          it 'subfieldtag _ && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$_$/', trace: true)
          end

          it 'subfieldtag _ && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$_$:', trace: true)
          end

          it 'subfieldtag _ && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$_$;', trace: true)
          end

          it 'subfieldtag _ && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$_$<', trace: true)
          end

          it 'subfieldtag _ && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$_$=', trace: true)
          end

          it 'subfieldtag _ && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$_$>', trace: true)
          end

          it 'subfieldtag _ && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$_$?', trace: true)
          end

          it 'subfieldtag _ && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$_$[', trace: true)
          end

          it 'subfieldtag _ && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$_$\\', trace: true)
          end

          it 'subfieldtag _ && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$_$]', trace: true)
          end

          it 'subfieldtag _ && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$_$^', trace: true)
          end

          it 'subfieldtag _ && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$_$_', trace: true)
          end

          it 'subfieldtag _ && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$_$`', trace: true)
          end

          it 'subfieldtag _ && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$_${', trace: true)
          end

          it 'subfieldtag _ && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$_$}', trace: true)
          end

          it 'subfieldtag _ && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$_$~', trace: true)
          end

          it 'subfieldtag ` && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$`$a', trace: true)
          end

          it 'subfieldtag ` && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$`$z', trace: true)
          end

          it 'subfieldtag ` && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$`$0', trace: true)
          end

          it 'subfieldtag ` && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$`$9', trace: true)
          end

          it 'subfieldtag ` && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$`$!', trace: true)
          end

          it 'subfieldtag ` && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$`$#', trace: true)
          end

          it 'subfieldtag ` && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$`$$', trace: true)
          end

          it 'subfieldtag ` && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$`$%', trace: true)
          end

          it 'subfieldtag ` && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$`$&', trace: true)
          end

          it "subfieldtag ` && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$`$'", trace: true)
          end

          it 'subfieldtag ` && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$`$(', trace: true)
          end

          it 'subfieldtag ` && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$`$)', trace: true)
          end

          it 'subfieldtag ` && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$`$*', trace: true)
          end

          it 'subfieldtag ` && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$`$+', trace: true)
          end

          it 'subfieldtag ` && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$`$,', trace: true)
          end

          it 'subfieldtag ` && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$`$-', trace: true)
          end

          it 'subfieldtag ` && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$`$.', trace: true)
          end

          it 'subfieldtag ` && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$`$/', trace: true)
          end

          it 'subfieldtag ` && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$`$:', trace: true)
          end

          it 'subfieldtag ` && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$`$;', trace: true)
          end

          it 'subfieldtag ` && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$`$<', trace: true)
          end

          it 'subfieldtag ` && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$`$=', trace: true)
          end

          it 'subfieldtag ` && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$`$>', trace: true)
          end

          it 'subfieldtag ` && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$`$?', trace: true)
          end

          it 'subfieldtag ` && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$`$[', trace: true)
          end

          it 'subfieldtag ` && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$`$\\', trace: true)
          end

          it 'subfieldtag ` && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$`$]', trace: true)
          end

          it 'subfieldtag ` && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$`$^', trace: true)
          end

          it 'subfieldtag ` && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$`$_', trace: true)
          end

          it 'subfieldtag ` && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$`$`', trace: true)
          end

          it 'subfieldtag ` && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$`${', trace: true)
          end

          it 'subfieldtag ` && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$`$}', trace: true)
          end

          it 'subfieldtag ` && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$`$~', trace: true)
          end

          it 'subfieldtag { && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...${$a', trace: true)
          end

          it 'subfieldtag { && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...${$z', trace: true)
          end

          it 'subfieldtag { && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...${$0', trace: true)
          end

          it 'subfieldtag { && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...${$9', trace: true)
          end

          it 'subfieldtag { && subfieldtag !' do
            expect(parser.marc_spec).to parse('...${$!', trace: true)
          end

          it 'subfieldtag { && subfieldtag #' do
            expect(parser.marc_spec).to parse('...${$#', trace: true)
          end

          it 'subfieldtag { && subfieldtag $' do
            expect(parser.marc_spec).to parse('...${$$', trace: true)
          end

          it 'subfieldtag { && subfieldtag %' do
            expect(parser.marc_spec).to parse('...${$%', trace: true)
          end

          it 'subfieldtag { && subfieldtag &' do
            expect(parser.marc_spec).to parse('...${$&', trace: true)
          end

          it "subfieldtag { && subfieldtag '" do
            expect(parser.marc_spec).to parse("...${$'", trace: true)
          end

          it 'subfieldtag { && subfieldtag (' do
            expect(parser.marc_spec).to parse('...${$(', trace: true)
          end

          it 'subfieldtag { && subfieldtag )' do
            expect(parser.marc_spec).to parse('...${$)', trace: true)
          end

          it 'subfieldtag { && subfieldtag *' do
            expect(parser.marc_spec).to parse('...${$*', trace: true)
          end

          it 'subfieldtag { && subfieldtag +' do
            expect(parser.marc_spec).to parse('...${$+', trace: true)
          end

          it 'subfieldtag { && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...${$,', trace: true)
          end

          it 'subfieldtag { && subfieldtag -' do
            expect(parser.marc_spec).to parse('...${$-', trace: true)
          end

          it 'subfieldtag { && subfieldtag .' do
            expect(parser.marc_spec).to parse('...${$.', trace: true)
          end

          it 'subfieldtag { && subfieldtag /' do
            expect(parser.marc_spec).to parse('...${$/', trace: true)
          end

          it 'subfieldtag { && subfieldtag :' do
            expect(parser.marc_spec).to parse('...${$:', trace: true)
          end

          it 'subfieldtag { && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...${$;', trace: true)
          end

          it 'subfieldtag { && subfieldtag <' do
            expect(parser.marc_spec).to parse('...${$<', trace: true)
          end

          it 'subfieldtag { && subfieldtag =' do
            expect(parser.marc_spec).to parse('...${$=', trace: true)
          end

          it 'subfieldtag { && subfieldtag >' do
            expect(parser.marc_spec).to parse('...${$>', trace: true)
          end

          it 'subfieldtag { && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...${$?', trace: true)
          end

          it 'subfieldtag { && subfieldtag [' do
            expect(parser.marc_spec).to parse('...${$[', trace: true)
          end

          it 'subfieldtag { && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...${$\\', trace: true)
          end

          it 'subfieldtag { && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...${$]', trace: true)
          end

          it 'subfieldtag { && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...${$^', trace: true)
          end

          it 'subfieldtag { && subfieldtag _' do
            expect(parser.marc_spec).to parse('...${$_', trace: true)
          end

          it 'subfieldtag { && subfieldtag `' do
            expect(parser.marc_spec).to parse('...${$`', trace: true)
          end

          it 'subfieldtag { && subfieldtag {' do
            expect(parser.marc_spec).to parse('...${${', trace: true)
          end

          it 'subfieldtag { && subfieldtag }' do
            expect(parser.marc_spec).to parse('...${$}', trace: true)
          end

          it 'subfieldtag { && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...${$~', trace: true)
          end

          it 'subfieldtag } && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$}$a', trace: true)
          end

          it 'subfieldtag } && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$}$z', trace: true)
          end

          it 'subfieldtag } && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$}$0', trace: true)
          end

          it 'subfieldtag } && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$}$9', trace: true)
          end

          it 'subfieldtag } && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$}$!', trace: true)
          end

          it 'subfieldtag } && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$}$#', trace: true)
          end

          it 'subfieldtag } && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$}$$', trace: true)
          end

          it 'subfieldtag } && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$}$%', trace: true)
          end

          it 'subfieldtag } && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$}$&', trace: true)
          end

          it "subfieldtag } && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$}$'", trace: true)
          end

          it 'subfieldtag } && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$}$(', trace: true)
          end

          it 'subfieldtag } && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$}$)', trace: true)
          end

          it 'subfieldtag } && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$}$*', trace: true)
          end

          it 'subfieldtag } && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$}$+', trace: true)
          end

          it 'subfieldtag } && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$}$,', trace: true)
          end

          it 'subfieldtag } && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$}$-', trace: true)
          end

          it 'subfieldtag } && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$}$.', trace: true)
          end

          it 'subfieldtag } && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$}$/', trace: true)
          end

          it 'subfieldtag } && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$}$:', trace: true)
          end

          it 'subfieldtag } && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$}$;', trace: true)
          end

          it 'subfieldtag } && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$}$<', trace: true)
          end

          it 'subfieldtag } && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$}$=', trace: true)
          end

          it 'subfieldtag } && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$}$>', trace: true)
          end

          it 'subfieldtag } && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$}$?', trace: true)
          end

          it 'subfieldtag } && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$}$[', trace: true)
          end

          it 'subfieldtag } && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$}$\\', trace: true)
          end

          it 'subfieldtag } && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$}$]', trace: true)
          end

          it 'subfieldtag } && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$}$^', trace: true)
          end

          it 'subfieldtag } && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$}$_', trace: true)
          end

          it 'subfieldtag } && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$}$`', trace: true)
          end

          it 'subfieldtag } && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$}${', trace: true)
          end

          it 'subfieldtag } && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$}$}', trace: true)
          end

          it 'subfieldtag } && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$}$~', trace: true)
          end

          it 'subfieldtag ~ && lowercase alpha subfieldtag a' do
            expect(parser.marc_spec).to parse('...$~$a', trace: true)
          end

          it 'subfieldtag ~ && lowercase alpha subfieldtag z' do
            expect(parser.marc_spec).to parse('...$~$z', trace: true)
          end

          it 'subfieldtag ~ && digit subfieldtag 0' do
            expect(parser.marc_spec).to parse('...$~$0', trace: true)
          end

          it 'subfieldtag ~ && digit subfieldtag 9' do
            expect(parser.marc_spec).to parse('...$~$9', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag !' do
            expect(parser.marc_spec).to parse('...$~$!', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag #' do
            expect(parser.marc_spec).to parse('...$~$#', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag $' do
            expect(parser.marc_spec).to parse('...$~$$', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag %' do
            expect(parser.marc_spec).to parse('...$~$%', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag &' do
            expect(parser.marc_spec).to parse('...$~$&', trace: true)
          end

          it "subfieldtag ~ && subfieldtag '" do
            expect(parser.marc_spec).to parse("...$~$'", trace: true)
          end

          it 'subfieldtag ~ && subfieldtag (' do
            expect(parser.marc_spec).to parse('...$~$(', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag )' do
            expect(parser.marc_spec).to parse('...$~$)', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag *' do
            expect(parser.marc_spec).to parse('...$~$*', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag +' do
            expect(parser.marc_spec).to parse('...$~$+', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag ,' do
            expect(parser.marc_spec).to parse('...$~$,', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag -' do
            expect(parser.marc_spec).to parse('...$~$-', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag .' do
            expect(parser.marc_spec).to parse('...$~$.', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag /' do
            expect(parser.marc_spec).to parse('...$~$/', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag :' do
            expect(parser.marc_spec).to parse('...$~$:', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag ;' do
            expect(parser.marc_spec).to parse('...$~$;', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag <' do
            expect(parser.marc_spec).to parse('...$~$<', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag =' do
            expect(parser.marc_spec).to parse('...$~$=', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag >' do
            expect(parser.marc_spec).to parse('...$~$>', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag ?' do
            expect(parser.marc_spec).to parse('...$~$?', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag [' do
            expect(parser.marc_spec).to parse('...$~$[', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag \\' do
            expect(parser.marc_spec).to parse('...$~$\\', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag ]' do
            expect(parser.marc_spec).to parse('...$~$]', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag ^' do
            expect(parser.marc_spec).to parse('...$~$^', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag _' do
            expect(parser.marc_spec).to parse('...$~$_', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag `' do
            expect(parser.marc_spec).to parse('...$~$`', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag {' do
            expect(parser.marc_spec).to parse('...$~${', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag }' do
            expect(parser.marc_spec).to parse('...$~$}', trace: true)
          end

          it 'subfieldtag ~ && subfieldtag ~' do
            expect(parser.marc_spec).to parse('...$~$~', trace: true)
          end
        end
      end
    end
  end
end
