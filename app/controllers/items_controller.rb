class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show]
  before_action :set_category, only: [:new, :edit, :create, :update, :destroy]

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
    @grandchild = @item.category
    @child = @grandchild.parent
    @parent = @item.category.root
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      flash[:alert] = "必須項目が空欄なので更新できませんでした"
      redirect_to edit_item_path
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
