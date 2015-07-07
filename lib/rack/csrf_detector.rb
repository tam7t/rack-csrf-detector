module Rack
  class CsrfDetector
    @@bad_count = 0

    def initialize(app, opts={}, &block)
      @app = app

      if block_given?
        if block.arity == 1
          block.call(self)
        else
          instance_eval(&block)
        end
      end
    end

    def call(env)
      @@bad_count = 0
      status, headers, response = @app.call(env)

      if env['REQUEST_METHOD'] == 'GET' && @@bad_count > 0
        headers["CSRF_WARNING"] = 'yes'
      end

      [status, headers, response]
    end

    def self.more_bad!
      @@bad_count += 1
    end

    private

    def use(klass)
      klass.new.use!
    end
  end
end
