class CreditsController < ApplicationController

  require "payjp"
  
  def index
  # クレジット一覧
  end
  def new
    credit = Credit.where(user_id: current_user.id).first
  end

  def create    
    Payjp.api_key = "sk_test_cf6acf8c965e34aca314f741"
    customer = Payjp::Customer.create(card: params[:payjp_Token])
    @credit = Credit.create(user_id: current_user.id, customer_id: customer.id, card_token: params[:payjp_Token])
  end

  def edit
  end

  def destroy
  # クレジット登録内容削除
  end

end
