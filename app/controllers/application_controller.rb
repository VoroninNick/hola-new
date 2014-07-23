class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  #protect_from_forgery

  before_filter :check_locale
  def check_locale
    locale = params[:locale]
    if request.path[0..5] != '/admin'
      if !locale
        preferred_locale = http_accept_language.compatible_language_from(I18n.available_locales)

        if preferred_locale
          locale = preferred_locale



        else
          locale = I18n.default_locale
        end
      end

      if locale != params[:locale]
        redirect_to url_for(locale: locale)
      end

      I18n.locale = locale
    end
  end
end
