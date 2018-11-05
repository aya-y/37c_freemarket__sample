class UsersController < ApplicationController
  def index
    @user = User.find_by(id: 1)         #idは仮置きです
  end

  def show
    @user = User.find_by(id: 1)         #idは仮置きです
    @item = @user.items.find_by(id: 1)   #idは仮置きです
    @item_images = Image.where(item_id: 1)#idは仮置きです
  end

  def in_progress
  end

  def completed
  end

  def purchase
  end

  def purchased
  end

  def listing
    # @user_details = UserDetail.find_by(params[:id])
    # @user = @user_details.user

    @user = User.find_by(id: 1)#idは仮置きです

    # @user_details = @user.user_detail
  end

end






