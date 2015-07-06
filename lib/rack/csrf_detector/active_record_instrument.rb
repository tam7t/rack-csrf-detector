require 'active_record/connection_adapters/abstract/transaction'

class Rack::CsrfDetector::ActiveRecordInstrument
  def use!
    if ActiveRecord::VERSION::STRING.match(/^4.2/)
      🙉_activerecord_4_2!
    else
      🙉_activerecord_4_0!
    end
  end

  private

  def 🙉_activerecord_4_0!
    ActiveRecord::ConnectionAdapters::OpenTransaction.class_eval do
      commit_method = instance_method(:commit)

      define_method :commit do
        Rack::CsrfDetector.more_bad!
        commit_method.bind(self).call
      end
    end
  end

  def 🙉_activerecord_4_2!
    ActiveRecord::ConnectionAdapters::Transaction.class_eval do
      commit_method = instance_method(:commit)

      define_method :commit do
        Rack::CsrfDetector.more_bad!
        commit_method.bind(self).call
      end
    end
  end
end
