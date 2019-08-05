class UsersController < ApplicationController

  def show
    @user_products = current_user.products
    @deals = Product.where(buyer_id: current_user.id, trade_status: 2)
    @finished_deals = Product.where(buyer_id: current_user.id, trade_status: 3)
  end

  def edit
  end

  def profile
  end

  def logout
  end

end
