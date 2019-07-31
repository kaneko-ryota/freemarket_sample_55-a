class UsersController < ApplicationController

  def show
    @user = current_user
    @user_products = @user.products
    @deals = Product.where(buyer_id: current_user.id, trade_status: 2)
    @finished_deals = Product.where(buyer_id: current_user.id, trade_status: 3)
  end

  def edit
  end

  def profile
  end

  def logout
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
