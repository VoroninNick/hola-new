class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :check_locale
  def check_locale
    locale = params[:locale]
    if !locale
      locale = I18n.default_locale
    end

    I18n.locale = locale
  end
end
