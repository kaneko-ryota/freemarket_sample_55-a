class CreditsController < ApplicationController
  before_action :authenticate_user!
  
  require "payjp"

  def index
  end

  def new
    @credit = Credit.new
    @credit.save
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer = Payjp::Customer.create
    card = customer.cards.create(card: params[:payjp_Token])
    @credit = Credit.create(
      user_id:     current_user.id,
      customer_id: customer.id,
      card_id:     card.id
    )
    redirect_to user_path(current_user)
  end

  def edit
  end

  def destroy
  end

end
