Dir.glob(File.expand_path('marc_spec/*.rb', __dir__)).sort.each(&method(:require))
