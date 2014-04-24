module MailThread
  extend ActiveSupport::Concern

  def sendmail(&block)
    thread = Thread.new do
      yield
      ActiveRecord::Base.connection.close
    end
    at_exit {thread.join}
  end
end