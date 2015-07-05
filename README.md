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
TODO
```

And include the middleware in your `development.rb`

```ruby
TODO
```

Note: Do not run this in production.

You can install the chrome extension.

```bash
$ chrome `pwd`/chrome-extension
```
