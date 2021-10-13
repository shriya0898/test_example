class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :age, :contact_no, :dob, :avatar])
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit( :first_name, :last_name, :age, :contact_no, :dob, :avatar)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :age, :contact_no, :dob, :avatar)}
    # devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :age, :contact_no, :dob, :avatar])
  end
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up){ |u| u.permit(:address_line, :city, :state, :country, :pincode)}
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update){ |u| u.permit(:address_line, :city, :state, :country, :pincode)}
  end
end
