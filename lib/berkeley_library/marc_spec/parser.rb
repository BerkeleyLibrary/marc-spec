Dir.glob(File.expand_path('parser/*.rb', __dir__)).sort.each(&method(:require))
