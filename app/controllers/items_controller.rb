class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images)
  end

  def new
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to root_path
    else
      flash[:alert] = "必須項目が空欄なので更新できませんでした"
      redirect_to edit_item_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :explain, :size, :prefecture_id, :brand, :shipping_date_id, :item_status_id, :postage_id, :category_id, images_attributes: [:src, :_destroy, :id]).merge(seller_id: current_user.id)
  end

  def buy
  end
end
