class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :permit_only_seller, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:edit, :update, :show]
  before_action :set_category, only: [:new, :edit, :create, :update, :destroy]

  def index
    @items = Item.includes(:images, :user)
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
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @parents = Category.limit(607)
  end

  def get_category_children
    @category_children = Category.find("#{params[:parent_id]}").children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  
  private

  def permit_only_seller
    redirect_to root_path, alert: "出品者のみが許可されるページです" unless set_item.seller_id == current_user.id
  end

  def item_params
    params.require(:item).permit(:name, :price, :explain, :size, :prefecture_id, :brand, :shipping_date_id, :item_status_id, :postage_id, :category_id, images_attributes: [:src, :_destroy, :id]).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_category  
    @category_parent_array = Category.where(ancestry: nil)
  end

  def buy
  end

end
