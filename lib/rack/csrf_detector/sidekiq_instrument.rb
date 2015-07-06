require 'sidekiq'

class Rack::CsrfDetector::SidekiqInstrument
  def use!
    Sidekiq.configure_client do |config|
      config.client_middleware do |chain|
        chain.add Middleware
      end
    end
  end

  class Middleware
    def call(worker_class, msg, queue, redis_pool)
      Rack::CsrfDetector.more_bad!
      yield
    end
  end
end
