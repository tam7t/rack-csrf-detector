# rack-csrf-detector
Rails only protects you against CSRFs if you use `GET` and `POST` [correctly](http://guides.rubyonrails.org/security.html#csrf-countermeasures).
This middleware helps you identify when a `GET` request results in an
application state-change.

## How It Works
`rack-csrf-detector` monkey-patches `ActiveRecord` to identify `GET` requests
that cause a database `commit`. A `CRSF-WARNING` header is added to responses
when this is detected. An accompanying chrome extension is available to alert
when the header is present.

## Usage
Add the following to your `Gemfile`

```ruby
gem 'rack-csrf-detector', :require => 'rack/csrf_detector'
```

And include the middleware in your `development.rb`

```ruby
config.middleware.use "Rack::CsrfDetector" do
  use Rack::CsrfDetector::ActiveRecordInstrument
  use Rack::CsrfDetector::SidekiqInstrument
end
```

Note: Do not run this in production.

You can also install the chrome extension:

```
More Tools | Extensions | Developer mode | Load Unpacked extension...
```

And select the `chrome-extension` folder in this repo.
