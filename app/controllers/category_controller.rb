class CategoryController < ApplicationController

  def index

  end

  def large_category
    @large_category_items = Item.where(large_category_id: params[:large_category_id])
  end

  def medium_category
    @medium_category_items = large_category.where(medium_category_id: params[:medium_category_id])
  end

  def small_category
    @small_category_items = medium_category.where(small_category_id: params[:small_category_id])
  end

end
