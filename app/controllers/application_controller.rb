class ApplicationController < ActionController::Base
  before_action :set_i18n_locale_from_params
  before_action :configure_permited_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  private
  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone])
  end
  def set_i18n_locale_from_params

    if params[:locale]
      if I18n.available_locales.map(&:to_s).include?(params[:locale])
        I18n.locale = params[:locale]
      else
        flash.now[:notice] =
            "#{params[:locale]} translation not available"
        logger.error flash.now[:notice]
      end
    end
  end
end
