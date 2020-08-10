class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  private
  def set_item
    params.require(:item).permit(:name, :price, :explain, :size, :prefecture_id, :brand, :shipping_date_id, :item_status_id, :postage_id, :category_id)
  end
end
