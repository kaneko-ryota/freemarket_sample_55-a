class CategoriesController < ApplicationController

  def index
  end

  def show
    @products = Product.all
    
  end

end
