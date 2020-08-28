class UsersController < ApplicationController
  def show
    @users = User.select("nickname")
  end

  def sales_items
    @sales_items = User.find(params[:id]).sales_items.includes(:images)
  end

  def sold_items
    @sold_items = User.find(params[:id]).sold_items.includes(:images)
  end
  
  def logout
  end
end
