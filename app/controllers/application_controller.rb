class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_timezone
    @current_timezone ||= (cookies["current_timezone"] || "UTC")
  end
  helper_method :current_timezone
end
