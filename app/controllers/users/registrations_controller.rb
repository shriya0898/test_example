# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
 before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
   @address = Address.new()
  
  end

  # POST /resource
  def create
    super
    # build_resource(configure_sign_up_params)
    # @address = Address.new(configure_sign_up_params)
    # # @address.user_id = resource.id
    # @address.save
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  
  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  def after_update_path_for(resource)
    case resource
    when :user, User
      resource.teacher? ? another_path : root_path
    else
      super
    end
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private 

  def address_params
    params.require(:address, :users).permit( addresses_attributes: [:address_line, :city, :state, :country, :pincode, :first_name, :last_name, :age, :contact_no, :dob, :avatar])
  end
end
