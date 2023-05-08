class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:user_name,
               :email,
               :password,
               :password_confirmation,
               :remember_me)
    end

    devise_parameter_sanitizer.permit(:sign_in) do |u|
      u.permit(:user_name,
               :password,
               :remember_me)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:user_name,
               :email,
               :password,
               :password_confirmation,
               :current_password)
    end
  end
end
