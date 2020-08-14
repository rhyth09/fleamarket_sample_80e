class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images)
  end

  def new
    @item = Item.new
    @item.images.build
    @category_parent_array = Category.where(ancestry: nil)
  end
  
  def get_category_children
    @category_children = Category.find("#{params[:parent_id]}").children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :explain, :size, :prefecture_id, :brand, :shipping_date_id, :item_status_id, :postage_id, :category_id, images_attributes: [:src])
  end

  def buy
  end
end
