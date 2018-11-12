class UserDetailsController < ApplicationController

  before_action :find_user

  def new
    if user_signed_in?
      @userdetail = UserDetail.new
    else
      redirect_to root_path
    end
  end

  def create
    @userdetail = UserDetail.new(user_detail_params)
    if @userdetail.save
      render action: 'create'
    else
      redirect_to action: 'new'
    end
  end

  def edit
  end

  def update
    if @user.id = current_user.id
      @userdetail = @user.userdetail
      @userdetail.update(userdetail_params)
      redirect_to edit_user_detail_path, notice: '変更が完了しました'
    else
      redirect_to root_path
    end
  end

private

  def find_user
    @user = User.find(params[:user_id])
  end

  def user_detail_params
    params.require(:user_detail).permit(:family_name, :first_name, :kana_family_name, :kana_first_name, :birthday, :prefecture, :city, :address, :residential_name, :phone_number, :postal_code, :profile, :user_image)
  end

end
