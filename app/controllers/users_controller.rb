class UsersController < ApplicationController

   before_action :set_user ,only:[:index,:in_progress,:completed,:purchase,:purchased,:listing]

  def index
    @item = Item.where(user_id: current_user.id)
    @items = Item.be_bought(@user.id).where.not(status: :received).order("created_at DESC")
    @bought_items = Item.be_bought(@user.id).where(status: :received).order("created_at DESC")
  end

  def show
    @user = User.find_by(id: params[:id])
    @item = @user.items.find(id: 1)   #
    @item_images = Image.where(item_id: 1)
    @userdetail = UserDetail.find(id: 1)#idは仮置きです
  end

  def edit
    @user = User.find(params[:id])
    @userdetail = UserDetail.find(params[:id])
  end

  def in_progress
    @items = @user.items.be_sold.where.not(status: :received).order("created_at DESC")
  end

  def completed
    @items = @user.items.be_sold.where(status: :received).order("created_at DESC")
  end

  def purchase
    @items = Item.be_bought(@user.id).where.not(status: :received).order("created_at DESC")
  end

  def purchased
    @items = Item.be_bought(@user.id).where(status: :received).order("created_at DESC")
  end

  def listing
    @items = @user.items.where(status: :stopped).order("created_at DESC") .or @user.items.where(status: :displayed).order("created_at DESC")
  end

  private

  def set_profile
    @userdetail = UserDetail.find(params[ :profile]).merge(user_id: current_user.id)
  end

  def set_user
    @user = User.find_by(id: current_user.id)
  end
end





