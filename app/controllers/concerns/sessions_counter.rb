module SessionsCounter
  extend ActiveSupport::Concern

  protected

    def index_session_counter
      session[:counter] ||= 0
      session[:counter] += 1
    end
end