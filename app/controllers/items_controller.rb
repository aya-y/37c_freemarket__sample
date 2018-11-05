class ItemsController < ApplicationController

  # before_action :move_to_root

  def index
    @items = Item.order("updated_at desc")
  end

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
        redirect_to "/users"
    else
      flash[:notice] = "出品に失敗しました。"
      redirect_to :root
    end
  end

  def show
    @item = Item.find(params[:id])
    @images = @item.images.order("created_at DESC")
  end

  def update
    @item = Item.find(params[:id])
    @image = @item.images.first
  end

  def area
    @items = Item.where(prefecture: params[:prefecture])
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :size, :condition, :charge_method, :prefecture, :handling_time, :price, :large_category_id, :medium_category_id, :small_category_id, :bland_id, :delivery_method,images_attributes:[:image]).merge(user_id: 1)
  end

end

