class TransactionDetailsController < ApplicationController

  before_action :set_item, only:[:show, :update]

  def show
    if @item.status == ("displayed" or "stopped")
      redirect_to item_path(@item)
    end
      @images = @item.images
      @user = @item.user
      @other_items = Item.where.not(status: :received).where.not(id: @item.id).limit(3)
  end

  def update
    if @item.status == "shipped"
      @item.update(status: :received)
      redirect_to users_purchased_path
      flash[:saler_notice] = "商品の到着を登録しました。"
    else
      @item.update(status: :shipped)
      redirect_to users_in_progress_path
      flash[:buyer_npticestop] = "商品の発送を登録しました。"
    end
  end

end

