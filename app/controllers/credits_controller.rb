class CreditsController < ApplicationController

  require "payjp"

  def index

  end

  def new

  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer = Payjp::Customer.create(card: params[:payjp_Token])
    @credit = Credit.create(user_id: current_user.id, customer_id: customer.id, card_token: params[:payjp_Token])
  end

  def edit
  end

  def destroy

  end

end
