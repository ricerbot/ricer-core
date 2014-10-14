module Ricer
  Dir["lib/tasks/**/*.rake"].each { |ext| load ext } if defined?(Rake)
end
