require 'spec_helper'
require 'parslet/rig/rspec'

module BerkeleyLibrary
  module MarcSpec
    context 'generated' do
      describe :subfield_tag_tag do
        let(:parser) { Parser.new }
        let(:reporter) { Parslet::ErrorReporter::Deepest.new }

        describe 'marc_spec: valid field tag and subfield tags' do
          # /valid/wildCombination_validSubfieldTagTag.json
          it 'subfieldtag & && digit subfieldtag 0 -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$0', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && digit subfieldtag 9 -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$9', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && lowercase alpha subfieldtag a -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$a', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && lowercase alpha subfieldtag z -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$z', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag ! -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$!', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag # -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$#', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag $ -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$$', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag % -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$%', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag & -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$&', trace: true, reporter: reporter)
          end

          it "subfieldtag & && subfieldtag ' -> valid" do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse("...$&$'", trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag ( -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$(', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag ) -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$)', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag * -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$*', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag + -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$+', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag , -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$,', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag - -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$-', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag . -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$.', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag / -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$/', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag : -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$:', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag ; -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$;', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag < -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$<', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag = -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$=', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag > -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$>', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag ? -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$?', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag [ -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$[', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag \\ -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$\\', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag ] -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$]', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag ^ -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$^', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag _ -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$_', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag ` -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$`', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag { -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&${', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag } -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$}', trace: true, reporter: reporter)
          end

          it 'subfieldtag & && subfieldtag ~ -> valid' do
            # /valid/wildCombination_validSubfieldTagTag.json
            expect(parser.marc_spec).to parse('...$&$~', trace: true, reporter: reporter)
          end

          describe 'lowercase alpha subfieldtag a' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$a$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$a$~', trace: true, reporter: reporter)
            end

          end

          describe 'lowercase alpha subfieldtag z' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$z$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$z$~', trace: true, reporter: reporter)
            end

          end

          describe 'digit subfieldtag 0' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$0$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$0$~', trace: true, reporter: reporter)
            end

          end

          describe 'digit subfieldtag 9' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$9$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$9$~', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag !' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$!$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$!$~', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag #' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$0", trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$9", trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$a", trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$z", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$!", trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$#", trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$$", trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$%", trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$&", trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$(", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$)", trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$*", trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$+", trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$,", trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$-", trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$.", trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$/", trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$:", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$;", trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$<", trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$=", trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$>", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$?", trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$[", trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$\\", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$]", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$^", trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$_", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$`", trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#${", trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$}", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\#$~", trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag $' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$$$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$$$~', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag %' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$%$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$%$~', trace: true, reporter: reporter)
            end

          end

          describe "subfieldtag '" do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$0", trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$9", trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$a", trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$z", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$!", trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$#", trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$$", trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$%", trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$&", trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$(", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$)", trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$*", trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$+", trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$,", trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$-", trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$.", trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$/", trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$:", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$;", trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$<", trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$=", trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$>", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$?", trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$[", trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$\\", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$]", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$^", trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$_", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$`", trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'${", trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$}", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$'$~", trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag (' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$($'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$(${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$($~', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag )' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$)$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$)$~', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag *' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$*$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$*$~', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag +' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$+$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$+$~', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag ,' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$,$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$,$~', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag -' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$-$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$-$~', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag .' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$.$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$.$~', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag /' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$/$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$/$~', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag :' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$:$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$:$~', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag ;' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$;$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$;$~', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag <' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$<$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$<$~', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag =' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$=$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$=$~', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag >' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$>$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$>$~', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag ?' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$?$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$?$~', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag [' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$[$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$[$~', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag \\' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$\\$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$\\$~', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag ]' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$]$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$]$~', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag ^' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$^$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$^$~', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag _' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$_$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$_$~', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag `' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$`$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$`$~', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag {' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...${$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...${$~', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag }' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$}$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$}$~', trace: true, reporter: reporter)
            end

          end

          describe 'subfieldtag ~' do

            it '&& digit subfieldtag 0 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$0', trace: true, reporter: reporter)
            end

            it '&& digit subfieldtag 9 -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$9', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag a -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$a', trace: true, reporter: reporter)
            end

            it '&& lowercase alpha subfieldtag z -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$z', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ! -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$!', trace: true, reporter: reporter)
            end

            it '&& subfieldtag # -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$#', trace: true, reporter: reporter)
            end

            it '&& subfieldtag $ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$$', trace: true, reporter: reporter)
            end

            it '&& subfieldtag % -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$%', trace: true, reporter: reporter)
            end

            it '&& subfieldtag & -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$&', trace: true, reporter: reporter)
            end

            it "&& subfieldtag ' -> valid" do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse("...$~$'", trace: true, reporter: reporter)
            end

            it '&& subfieldtag ( -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$(', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ) -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$)', trace: true, reporter: reporter)
            end

            it '&& subfieldtag * -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$*', trace: true, reporter: reporter)
            end

            it '&& subfieldtag + -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$+', trace: true, reporter: reporter)
            end

            it '&& subfieldtag , -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$,', trace: true, reporter: reporter)
            end

            it '&& subfieldtag - -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$-', trace: true, reporter: reporter)
            end

            it '&& subfieldtag . -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$.', trace: true, reporter: reporter)
            end

            it '&& subfieldtag / -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$/', trace: true, reporter: reporter)
            end

            it '&& subfieldtag : -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$:', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ; -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$;', trace: true, reporter: reporter)
            end

            it '&& subfieldtag < -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$<', trace: true, reporter: reporter)
            end

            it '&& subfieldtag = -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$=', trace: true, reporter: reporter)
            end

            it '&& subfieldtag > -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$>', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ? -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$?', trace: true, reporter: reporter)
            end

            it '&& subfieldtag [ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$[', trace: true, reporter: reporter)
            end

            it '&& subfieldtag \\ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$\\', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ] -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$]', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ^ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$^', trace: true, reporter: reporter)
            end

            it '&& subfieldtag _ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$_', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ` -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$`', trace: true, reporter: reporter)
            end

            it '&& subfieldtag { -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~${', trace: true, reporter: reporter)
            end

            it '&& subfieldtag } -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$}', trace: true, reporter: reporter)
            end

            it '&& subfieldtag ~ -> valid' do
              # /valid/wildCombination_validSubfieldTagTag.json
              expect(parser.marc_spec).to parse('...$~$~', trace: true, reporter: reporter)
            end

          end

        end
      end
    end
  end
end
