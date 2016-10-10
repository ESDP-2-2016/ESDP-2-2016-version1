class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :configure_permited_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  private
  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone])
  end
  def set_locale
    if cookies[:educator_locale] && I18n.available_locales.include?(cookies[:educator_locale].to_sym)
      l = cookies[:educator_locale].to_sym
    else
      l = I18n.default_locale
      cookies.permanent[:educator_locale] = l
    end
    I18n.locale = l
  end
end
