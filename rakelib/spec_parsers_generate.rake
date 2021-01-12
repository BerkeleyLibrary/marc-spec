require 'json'
require 'ostruct'
require 'rubocop'

namespace :spec do
  namespace :parsers do
    desc 'regenerates the parser spec suite from MARCSpec-Test-Suite'
    task :generate do
      quote = ->(s) { s.include?("'") ? s.inspect : s.inspect.sub(/^"(.*)"$/, "'\\1'") }

      parser_specs_path = 'spec/marc/spec/parser'
      template_path = 'spec/marc/spec/parser_specs.rb.erb'
      template = ERB.new(File.read(template_path), trim_mode: '-')
      template.filename = template_path

      rule_re = %r{/(?<wild>wildCombination_)?(?:valid|invalid)(?<rule>[A-Z][[:alpha:]]+)\.json$}

      specs_by_rule = {}
      wild_specs_by_rule = {}

      Dir.glob('spec/suite/*valid/*.json').sort.map do |json_file|
        raise ArgumentError, "#{json_file} does not match /#{rule_re.source}/" unless (md = rule_re.match(json_file))

        spec = JSON.parse(File.read(json_file), object_class: OpenStruct)
        rule = md[:rule].gsub(/(?<!^)[A-Z]/) { "_#{$&}" }.downcase # camel to snake case

        spec.rule = quote.call(rule)
        spec.description = quote.call(spec.description)

        if md[:wild]
          spec.parse_method = :marc_spec
          spec.tests.each { |t| t.description = t.description.sub(/^(?:in)?valid wild combination: /, '') }
          specs = (wild_specs_by_rule[rule] ||= [])
        else
          spec.parse_method = rule
          specs = (specs_by_rule[rule] ||= [])
        end

        spec.tests.each do |t|
          t.description = quote.call(t.description)
          t.data = quote.call(t.data)
        end

        specs << spec
      end

      (specs_by_rule.keys | wild_specs_by_rule.keys).sort.each do |rule|
        # noinspection RubyUnusedLocalVariable
        specs = (specs_by_rule[rule] || []) + (wild_specs_by_rule[rule] || [])
        spec_path = File.join(parser_specs_path, "#{rule}_spec.rb")
        puts "Writing #{specs.size} specs to #{spec_path}"
        spec_source = template.result(binding).gsub(/ +$/, '')
        File.write(spec_path, spec_source)
        RuboCop::CLI.new.run([spec_path])
      end

    end
  end
end
