class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to controller: :products, action: :index
    else
      render :new
    end
  end

  def index
  end

  def show
    @product = Product.find(params[:id])
    @price = @product.price.to_s(:delimited)
    @user = @product.user
    @products_other = @user.products.where.not(id: params[:id]).order("id desc")
  end

  def purchase_confirmation
  end

  private
  def product_params
    params.require(:product).permit(:name, :explain, :size, :item_status, :burden, :delivery_method, :region, :delivery_date, :price, :trade_status, :saler_id, :purchase_id, :category_id, :brand_id, :user_id).merge(user_id: current_user.id, saler_id: current_user.id)
  end

end
