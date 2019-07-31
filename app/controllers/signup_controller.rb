class SignupController < ApplicationController

  def top
  end

  def member_info
    @user = User.new
  end

  def sms
  end

  def sms_authentication
    session[:name] = user_params[:name]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    @user = User.new(user_params)
  end

  def user_info

  end

  def credit

  end

  def complete
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  def create
    @user = User.new(
    name: session[:name], # sessionに保存された値をインスタンスに渡す
    email: session[:email],
    password: session[:password],
    password_confirmation: session[:password_confirmation],
  )
    if @user.save
      session[:id] = @user.id
      redirect_to complete_signup_index_path
    else
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
