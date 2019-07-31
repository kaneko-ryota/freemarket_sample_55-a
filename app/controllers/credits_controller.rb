class CreditsController < ApplicationController

  require "payjp"
  
  def index

  end
  
  def new

  end

  def create    
    Payjp.api_key = "sk_test_cf6acf8c965e34aca314f741"
    customer = Payjp::Customer.create(card: params[:payjp_Token])
    @credit = Credit.create(user_id: current_user.id, customer_id: customer.id, card_token: params[:payjp_Token])
  end

  def destroy
    
  end

end
