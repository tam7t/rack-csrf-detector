module Rack
  class CsrfDetector
    @@bad_count = 0

    def initialize(app)
      @app = app
      🙉_activerecord!
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

    def 🙉_activerecord!
      if ActiveRecord::VERSION::STRING.match(/^4.2/)
        🙉_activerecord_4_2!
      else
        🙉_activerecord_4_0!
      end
    end

    def 🙉_activerecord_4_0!
      require 'active_record/connection_adapters/abstract/transaction'

      ActiveRecord::ConnectionAdapters::OpenTransaction.class_eval do
        commit_method = instance_method(:commit)

        define_method :commit do
          Rack::CsrfDetector.more_bad!
          commit_method.bind(self).call
        end
      end
    end

    def 🙉_activerecord_4_2!
      require 'active_record/connection_adapters/abstract/transaction'

      ActiveRecord::ConnectionAdapters::Transaction.class_eval do
        commit_method = instance_method(:commit)

        define_method :commit do
          Rack::CsrfDetector.more_bad!
          commit_method.bind(self).call
        end
      end
    end
  end
end
