class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.new
    @product = Product.create(product_params)
    if @product.save
      redirect_to controller: :products, action: :index
    else
      render :new
    end
  end

  def index
    @products_ladies = Product.ladies
    @products_mens = Product.mens
  end

  def show
  end

  def purchase_confirmation
  end

  private
  def product_params
    params.require(:product).permit(:name, :explain, :size, :item_status, :burden, :delivery_method, :region, :delivery_date, :price, :trade_status, :saler_id, :purchase_id, :category_id, :brand_id, :user_id).merge(user_id: 1, brand_id: 1, saler_id: 1)
  end

end
