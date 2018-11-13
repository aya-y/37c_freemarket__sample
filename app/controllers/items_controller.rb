class ItemsController < ApplicationController

PICTURE_COUNT = 4
  before_action :set_item ,only:[:payjp,:destroy,:show,:edit,:update,:stop,:resume,:buy]
  def payjp
    require 'payjp'
    Payjp.api_key = PAYJP_SECRET_KEY
    @user = User.find(current_user.id)
    @item.with_lock do
      if @item.buyer_id == nil && @item.status == "displayed"
        Payjp::Charge.create(
          :amount => @item.price,
          :card => params['payjp-token'],
          :currency => 'jpy',
        )
        @item.update!(buyer_id: @user.id)
        @item.update!(status: :trading)
        redirect_to  users_purchase_path
        flash[:notice] = '購入が完了しました。'
      else
        redirect_to :root
        flash[:alert] = '購入に失敗しました。申し訳ありません。入力中に出品停止されたか、他ユーザーに売却されました。'
      end
    end
  end

  def index
    @items = Item.be_indexed.order("RAND()").limit(4)
    @ladies_items = Item.where(large_category_id: '1').be_indexed.order("created_at DESC").limit(4)
  end

  def new
    if user_signed_in?
      @item = Item.new
      PICTURE_COUNT.times{@item.images.build}
    else
      redirect_to new_current_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to users_listing_path
      flash[:notice] = "出品を完了しました。"
    else
      flash[:alert] = "出品に失敗しました。"
      redirect_to :root
    end
  end

  def destroy
    if @item.user_id == current_user.id
       @item.destroy
       redirect_to users_listing_path
       flash[:notice] = "削除を完了しました。"
    else
       redirect_to item_path(@item)
       flash[:notice] = "削除に失敗しました。"
    end
  end

  def show
    @images = @item.images.order("created_at DESC")
    @other_items = Item.where(user_id: @item.user_id).be_indexed.where.not(id: @item.id).limit(3)
  end

  def edit

    # if @item.user != current_user.id
    #   redirect_to root_path, notice: "権限がありません"
    # end
    @item = Item.find(params[:id])
    # @image = Image.find(params[:id])
    @item.image = Image.new if @item.images.blank?
    count = @item.images.count
    (PICTURE_COUNT - count).times {@item.images.build}
  end

  def update
    if @item.update(item_params)
      redirect_to users_listing_path
      flash[:notice] = "編集を完了しました。"
    else
      redirect_to edit_item_path
      flash[:alert] = "編集に失敗しました。"
    end
  end

  def stop
    if @item.update(status: :stopped)

      redirect_back(fallback_location: root_path)
      flash[:notice] = "出品の一旦停止をしました。"
    else
      redirect_to item_path(@item)
      flash[:alert] = "出品の一旦停止に失敗しました。"
    end
  end

  def resume
    if @item.update(status: :displayed)

      redirect_back(fallback_location: root_path)
      flash[:notice] = "出品の再開をしました。"
    else
      redirect_to item_path(@item)
      flash[:alert] = "出品の再開に失敗しました。"
    end
  end

  def buy
    if user_signed_in?
      @image = @item.images.first
    else
      redirect_to new_current_user_session_path
    end
  end

  def area
    @items = Item.where(prefecture: params[:prefecture])
  end


  private

  def item_params
    params.require(:item).permit(:item_name, :description, :size, :condition, :charge_method, :prefecture, :handling_time, :price, :large_category_id, :medium_category_id, :small_category_id, :bland_id, :delivery_method,images_attributes:[:image, :image_cache, :_destroy, :id]).merge(status: :displayed).merge(user_id: current_user.id)
  end


end

