class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: :logout

  def show
    @user_products = current_user.products
    @deals = Product.where(buyer_id: current_user.id, trade_status: 2)
    @finished_deals = Product.where(buyer_id: current_user.id, trade_status: 3)
  end

  def edit
  end

  def profile
  end

  def update
    if @user.update(user_params)
      redirect_to profile_user_path, notice: "変更しました。"
    else
      render :show
    end
  end

  def logout
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :profile)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
