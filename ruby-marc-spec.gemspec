File.expand_path('lib', __dir__).tap do |lib|
  $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
end

ruby_version = begin
  ruby_version_file = File.expand_path('.ruby-version', __dir__)
  File.read(ruby_version_file).strip
end

require 'marc/spec/module_info'

Gem::Specification.new do |spec|
  spec.name = MARC::Spec::ModuleInfo::NAME
  spec.author = MARC::Spec::ModuleInfo::AUTHOR
  spec.email = MARC::Spec::ModuleInfo::AUTHOR_EMAIL
  spec.summary = MARC::Spec::ModuleInfo::SUMMARY
  spec.description = MARC::Spec::ModuleInfo::DESCRIPTION
  spec.license = MARC::Spec::ModuleInfo::LICENSE
  spec.version = MARC::Spec::ModuleInfo::VERSION
  spec.homepage = MARC::Spec::ModuleInfo::HOMEPAGE

  spec.files = `git ls-files -z`.split("\x0")
  spec.require_paths = ['lib']

  spec.required_ruby_version = ">= #{ruby_version}"

  spec.add_dependency 'marc', '~> 1.1'
  spec.add_dependency 'parslet', '~> 2.0'
  spec.add_dependency 'typesafe_enum', '~> 0.3'

  spec.add_development_dependency 'bundle-audit', '~> 0.1'
  spec.add_development_dependency 'ci_reporter_rspec', '~> 1.0'
  spec.add_development_dependency 'colorize', '~> 0.8'
  spec.add_development_dependency 'dotenv', '~> 2.7'
  spec.add_development_dependency 'irb', '~> 1.2' # workaroundfor https://github.com/bundler/bundler/issues/6929
  spec.add_development_dependency 'listen', '>= 3.0.5', '< 3.2'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'rubocop', '~> 0.91.0'
  spec.add_development_dependency 'simplecov', '~> 0.21.1'
  spec.add_development_dependency 'simplecov-rcov', '~> 0.2'
end
