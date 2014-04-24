module MailThread
  extend ActiveSupport::Concern

  def sendmail(order)
    thread = Thread.new do
      OrderNotifier.received(order).deliver
      ActiveRecord::Base.connection.close
    end
    at_exit {thread.join}
  end
end