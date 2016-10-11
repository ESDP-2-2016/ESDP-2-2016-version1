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
      begin
        country_code = request.location.country_code
        if country_code
          country_code = country_code.downcase.to_sym
          # use russian for CIS countries, english for others
          [:ru, :kz, :ua, :by, :tj, :uz, :md, :az, :am, :kg, :tm].include?(country_code) ? l = :ru : l = :en
        else
          l = I18n.default_locale # use default locale if cannot retrieve this info
        end
      rescue
        l = I18n.default_locale
      ensure
        cookies.permanent[:educator_locale] = l
      end
    end
    I18n.locale = l
  
  #   if cookies[:educator_locale] && I18n.available_locales.include?(cookies[:educator_locale].to_sym)
  #     l = cookies[:educator_locale].to_sym
  #   else
  #     l = I18n.default_locale
  #     cookies.permanent[:educator_locale] = l
  #   end
  #   I18n.locale = l
  end
end
