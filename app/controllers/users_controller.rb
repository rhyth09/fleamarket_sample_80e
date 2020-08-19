class UsersController < ApplicationController
  before_action :set_user, only: [:show,]

  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @items = user.items
  end

  def set_user
    @user = User.find(params[:id])
  end


end
