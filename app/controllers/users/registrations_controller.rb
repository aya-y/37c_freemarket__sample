# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  # before_action :configure_account_update_params, only: [:update]

  def confirm
    @user = User.new(sign_up_params)
    if @user.valid?
      @user.save
      @userdetail = UserDetail.new
      render action: 'confirm'
    else
     render action: 'new'
    end
  end

  def complete
    @userdetail = UserDetail.new(signup_params)
    if @userdetail.valid?
       @userdetail.save
       render action: 'complete'
    else
       render action: 'new'
    end
  end

  # GET /resource
  # def new
  #   super
  # end

  # def create
  #   @user = User.new
  #     if verify_recaptcha
  #       super
  #     else
  #         respond_with_navigational(resource) {render :new}
  #     end
  # end

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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

private
  def signup_params
    params.require(:user_detail).permit(:family_name, :first_name, :kana_family_name, :kana_first_name, :birthday, :prefecture, :city, :address, :residential_name, :phone_number, :postal_code, :profile, :user_image)
  end

end
