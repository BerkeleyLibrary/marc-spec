Dir.glob(File.expand_path('parser_specs/*.rb', __dir__)).sort.each(&method(:require))
