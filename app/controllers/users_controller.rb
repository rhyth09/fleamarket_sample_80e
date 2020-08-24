class UsersController < ApplicationController
  def show
  end

  def sales_items
    @sales_items = User.find(params[:id]).sales_items.includes(:images)
  end
  
  def logout
  end
end
