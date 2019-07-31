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
    @products_ladies = Product.ladies
    @products_mens = Product.mens

    @chanels = Product.chanel
    @nikes = Product.nike
  end

  def show
    @product = Product.find(params[:id])
    @price = @product.price.to_s(:delimited)
    @user = @product.user
    @products_other = @user.products.where.not(id: params[:id]).order("id desc")
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to controller: :products, action: :show
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @producrt.user_id == current_user.id
      @product.destroy
    else
      render :index
    end
  end

  def purchase_confirmation
  end

  private
  def product_params
    params.require(:product).permit(:name, :explain, :size, :item_status, :burden, :delivery_method, :region, :delivery_date, :price, :trade_status, :saler_id, :purchase_id, :category_id, :brand_id, :user_id).merge(user_id: current_user.id, saler_id: current_user.id)
  end

end
