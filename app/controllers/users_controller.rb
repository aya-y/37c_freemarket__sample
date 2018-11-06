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
    @user = User.find_by(id: 1)#idは仮置きです
  end

  def completed
    @user = User.find_by(id: 1)#idは仮置きです
  end

  def purchase
    @user = User.find_by(id: 1)#idは仮置きです
  end

  def purchased
    @user = User.find_by(id: 1)#idは仮置きです
  end

  def listing

    @user = User.find_by(id: 1)#idは仮置きです
    @items = @user.items.order("created_at DESC")
  end

end






