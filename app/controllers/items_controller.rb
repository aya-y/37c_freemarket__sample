class ItemsController < ApplicationController

PICTURE_COUNT = 4

  def payjp
    require 'payjp'
    Payjp.api_key = PAYJP_SECRET_KEY
    @item = Item.find(params[:id])
    @user = User.find(1)   #id: 1は仮置きです。ログイン機能実装したらcurrent_user.idとします。
    @item.with_lock do
      if @item.buyer_id == nil
        Payjp::Charge.create(
          :amount => @item.price,
          :card => params['payjp-token'],
          :currency => 'jpy',
        )
        @item.update!(buyer_id: @user.id)
        redirect_to  users_purchase_path
        flash[:notice] = '購入が完了しました。'
      else
        redirect_to :root
        flash[:notice] = '購入に失敗しました。申し訳ありません。売却済みの商品です。'
      end
    end
  end

  def index
    @items = Item.order("updated_at desc")
  end

  def new
    @item = Item.new
    PICTURE_COUNT.times{@item.images.build}
  end

  def create
    @item = Item.new(item_params)
    if @item.save
        redirect_to "/users/listing"
    else
      flash[:notice] = "出品に失敗しました。"
      redirect_to :root
    end
  end

# user_id 1は仮置きです。ログイン機能実装したらcurrent_user.idとします。
  def destroy
    item = Item.find(params[:id])
    images = item.images
    if item.user_id == 1
      item.delete
      images.destroy_all
      redirect_to "/users/listing"
    end
  end

  def show
    @user = User.find(1) #挙動確認用の仮置きユーザーです。（商品詳細ページでuserによって購入or編集を切り替えるため）
    @item = Item.find(params[:id])
    @images = @item.images.order("created_at DESC")
  end

  def edit
    @item = Item.find(params[:id])
    @images = @item.images
    # @item.images = Image.new if @item.images.blank?
    count = @images.length
    (PICTURE_COUNT - count).times {@item.images.build}
    # @item.images.cache_key unless @item.images.blank?
  end

  def update
    @item = Item.find(params[:id])
    binding.pry
    if @item.update(item_params)
      redirect_to users_listing_path, notice: "商品を編集しました"
    else
      redirect_to edit_item_path
    end
  end

  def buy
    @item = Item.find(params[:id])
    @image = @item.images.first
  end

  def area
    @items = Item.where(prefecture: params[:prefecture])
  end


  private

  def item_params
    params.require(:item).permit(:item_name, :description, :size, :condition, :charge_method, :prefecture, :handling_time, :price, :large_category_id, :medium_category_id, :small_category_id, :bland_id, :delivery_method,images_attributes:[:image, :image_cache, :_destroy, :id]).merge(user_id: 1) #idは仮置きです。
  end

end


