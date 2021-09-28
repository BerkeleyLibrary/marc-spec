Dir.glob(File.expand_path('query/*.rb', __dir__)).sort.each(&method(:require))
