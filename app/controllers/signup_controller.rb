class SignupController < ApplicationController
  # before_action :user_signed_in
  def top
  end

  def member_info
    @user = User.new
  end

  def save_session1
    @user = User.new(user_params)
    session[:name] = user_params[:name]
    session[:name_kana] = user_params[:name_kana]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:nickname] = user_params[:nickname]
    session[:birthday] = @user.birthday
    
    if @user.valid?
      redirect_to sms_signup_index_path
    else
      render 'member_info'
    end

  end

  def sms
    @user = User.new
  end

  def sms_authentication
    @user = User.new
  end

  def user_info
    @address = Address.new
    @address.save
  end

  def credit
    @credit = Credit.new
    @credit.save
  end

  def complete
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  def create
    @user = User.new(
    name: session[:name],
    name_kana: session[:name_kana],
    email: session[:email],
    password: session[:password],
    password_confirmation: session[:password_confirmation],
    nickname: session[:nickname],
    birthday: session[:birthday]
  )

    if @user.save
      session[:id] = @user.id
      redirect_to complete_signup_index_path
    else
    end
  end

  def complete
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer = Payjp::Customer.create
    card = customer.cards.create(card: params[:payjp_Token])
    @credit = Credit.create(
      user_id:     current_user.id,
      customer_id: customer.id,
      card_id:     card.id
      )
      # redirect_to complete_signup_index_path
  end

private
  def user_params
    params.require(:user).permit(:name, :name_kana, :email, :password, :password_confirmation, :nickname, :birthday)
  end

  def user_signed_in
    if user_signed_in?
      redirect_to root_path
    end
  end
end
