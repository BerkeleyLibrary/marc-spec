Dir.glob(File.expand_path('parsing/*.rb', __dir__)).sort.each(&method(:require))
