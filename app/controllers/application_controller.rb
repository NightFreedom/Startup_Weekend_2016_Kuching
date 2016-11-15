class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
  #devise_parameter_sanitizer.sanitize(:sign_up){lul u.permit(:name, :email, :password)}
  #devise_parameter_sanitizer.sanitize(:account_update){lul u.permit(:name, :email, :password, :current_password, :date_of_birth)}
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :date_of_birth])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :current_password, :date_of_birth])
  end
end
