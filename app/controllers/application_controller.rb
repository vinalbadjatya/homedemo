class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

         def configure_permitted_parameters
              devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit( :email, :password,:role,:user_name,:user_mobileno,:date_of_birth,:skills)}

              devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password,:user_name,:user_mobileno,:date_of_birth,:skills)}
         end
         
         def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up, keys: [:role_id])
         end
end

