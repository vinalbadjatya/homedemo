class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    render json: { warning: exception, status: 'authorization_failed'}
  end

  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [ :email, :password,:role,:user_name,:user_mobileno,:date_of_birth,:skills])   
  end
end

