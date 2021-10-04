Dir.glob(File.expand_path('queries/*.rb', __dir__)).sort.each(&method(:require))
