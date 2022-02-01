require 'simplecov-rcov'

SimpleCov.start do
  add_filter %r{^/spec/}
  add_filter 'module_info.rb'

  coverage_dir 'artifacts'
  formatter SimpleCov::Formatter::RcovFormatter
  minimum_coverage 100
end
