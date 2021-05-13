require 'rspec/core/rake_task'
require 'pathname'

namespace :spec do
  specs_dir = File.expand_path('../spec', __dir__)
  generated_specs_dir = 'marc/spec/parser'

  desc "regenerates #{generated_specs_dir} from MARCSpec-Test-Suite"
  task :generate do
    require_relative 'parser_specs'

    in_dir = File.join(specs_dir, 'suite')
    out_dir = File.join(specs_dir, generated_specs_dir)

    ParserSpecs::Rule.all_from_json(in_dir).each do |rule|
      rule.write_rspec_to(out_dir)
    end

    RuboCop::CLI.new.run([out_dir])
  end
end

RSpec::Core::RakeTask.new do |task|
  task.rspec_opts = %w[--color --format documentation --order default]
  task.pattern = 'spec/**/*_spec.rb'
end
