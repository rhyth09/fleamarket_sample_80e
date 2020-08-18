class CategoriesController < ApplicationController

  def index
    @parents = Category.limit(13)
  end
  
end
