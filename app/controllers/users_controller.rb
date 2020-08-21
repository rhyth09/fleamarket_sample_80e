class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = seller.nickname
    @items = seller.items
  end
  
  def logout
  end


end
