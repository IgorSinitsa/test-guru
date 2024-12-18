class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
    { lang: I18n.locale != I18n.default_locale ? I18n.locale : nil }
  end

  protected

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :nik_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :nik_name])
  end

  def after_sign_in_path_for(resource)
    flash[:notice] = full_name(current_user)
    if resource.admin?
      admin_tests_path
    else
      tests_path
    end
  end

  def full_name(user)
    if user.last_name.present?
      "Welcome #{user.first_name.capitalize} #{user.last_name.capitalize} "
    else
      "Welcome #{user.email}"
    end
  end
end
