class UsersController < ApplicationController
  def show
    @users = User.select("nickname")
  end

  def logout
  end
end
