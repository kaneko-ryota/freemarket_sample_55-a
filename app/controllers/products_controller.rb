class ProductsController < ApplicationController

  before_action :set_product,  only: [:show, :edit, :update, :destroy, :purchase_confirmation, :buy]
  def index
    @products_ladies = Product.ladies
    @products_mens = Product.mens

    @chanels = Product.chanel
    @nikes = Product.nike
  end

  def new
    @product = Product.new
    @product.product_images.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      new_image_params[:images].each do |image|
        @product.product_images.create(image: image, product_id: @product.id)
      end
      redirect_to controller: :products, action: :index
    else
      render :new
    end
  end

  def index
    @products_ladies = Product.ladies
    @products_mens = Product.mens

    @chanels = Product.chanels
    @nikes = Product.nikes
  end

  def show
    @price = @product.price.to_s(:delimited)
    @user = @product.user
    @products_other = @user.products.where.not(id: params[:id]).order("id desc")
    @comments = @product.comments
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to controller: :products, action: :show
    else
      render :edit
    end
  end

  def destroy
    if @product.user_id == current_user.id
      @product.destroy
      redirect_to products_path
    else
      render :index
    end
  end

  def purchase_confirmation
  end

  require "payjp"

  def buy
    @product.update(
      user_id: current_user.id,
      buyer_id: current_user.id,
      trade_status: "2"
    )

    credit = Credit.find_by(user_id: current_user.id)
    charge = Payjp::Charge.create(
      amount:   @product.price,
      customer: credit.customer_id,
      currency: 'jpy'
      )
    redirect_to root_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :explain, :size, :item_status, :burden, :delivery_method, :region, :delivery_date, :price, :trade_status, :saler_id, :buyer_id, :category_id, :brand_id, :user_id).merge(user_id: current_user.id, saler_id: current_user.id)
  end

  def new_image_params
    params.require(:new_images).permit({images: []})
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
