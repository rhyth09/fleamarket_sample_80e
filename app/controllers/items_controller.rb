class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(set_item)
    if @item.save
      redirect_to new_items_path, notice: "作成しました"
    else
      render :new
    end
  end

  private
  def set_item
    params.require(:item).permit(:name, :price, :explain, :size, :prefecture_id, :brand, :shipping_date_id, :item_status_id, :postage_id, :category_id)
  end
end
