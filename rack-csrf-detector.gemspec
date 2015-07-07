Gem::Specification.new do |s|
  s.name        = 'rack-csrf-detector'
  s.version     = '0.2.0'
  s.date        = '2015-07-06'
  s.summary     = "Automated CSRF detection middleware"
  s.description = "This middleware helps you identify when a GET request results in an
application state-change"
  s.authors     = ["Tommy Murphy"]
  s.email       = 'tommy.murphy@gmail.com'
  s.files       = ["lib/rack/csrf_detector.rb",
                   "lib/rack/csrf_detector/active_record_instrument.rb",
                   "lib/rack/csrf_detector/sidekiq_instrument.rb"]
  s.homepage    = 'https://github.com/tam7t/rack-csrf-detector'
  s.license     = 'MIT'
end
