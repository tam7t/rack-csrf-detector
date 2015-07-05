Gem::Specification.new do |s|
  s.name        = 'rack-csrf-detector'
  s.version     = '0.1.0'
  s.date        = '2015-07-04'
  s.summary     = "Automated CSRF detection middleware"
  s.description = "This middleware helps you identify when a GET request results in an
application state-change"
  s.authors     = ["Tommy Murphy"]
  s.email       = 'tommy.murphy@gmail.com'
  s.files       = ["lib/rack/csrf_detector.rb"]
  s.homepage    = 'https://github.com/tam7t/rack-csrf-detector'
  s.license     = 'MIT'
end
