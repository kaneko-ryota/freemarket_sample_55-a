class CreditsController < ApplicationController

  require "payjp"
  
  def index
  # クレジット一覧
  end
  def new
    # card = Card.where(user_id: current_user.id)
  end

  def create
    Payjp.api_key = "sk_test_cf6acf8c965e34aca314f741"
    customer = Payjp::Charge.create(card: params[:payjpToken])
    @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_token: params[:payjpToken])
    if @card.save
      redirect_to root_path
    else
      redirect_to new_credit_path
    end
  end

  def destroy
  # クレジット登録内容削除
  end

end
