require 'json'
require 'ostruct'
require 'rubocop'
require_relative 'parser_specs'

# TODO: Make this a class
namespace :spec do
  namespace :parsers do
    desc 'regenerates the parser spec suite from MARCSpec-Test-Suite'
    task :generate do
      parser_specs_path = File.expand_path('../spec/marc/spec/parser', __dir__)

      template_path = File.expand_path('parser_specs/parser_specs.rb.txt.erb', __dir__)
      template = ERB.new(File.read(template_path), trim_mode: '-')
      # template.filename = template_path

      # noinspection RubyUnusedLocalVariable
      ParserSpecs::Rule.all_from_json('spec/suite').each do |rule|
        spec_source = template
          .result(binding)
          .gsub(/ +$/, '')
          .gsub(/\n\n+/, "\n\n")

        spec_path = File.join(parser_specs_path, "#{rule}_spec.rb")
        puts "writing #{spec_path}"
        File.write(spec_path, spec_source)
        RuboCop::CLI.new.run([spec_path])
      end
    end
  end
end
