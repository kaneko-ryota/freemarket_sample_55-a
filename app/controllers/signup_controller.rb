class SignupController < ApplicationController
  require "moji"
  before_action :user_signed_in, only: [:save_session1, :sms, :sms, :sms_authentication]

  def top
  end

  def member_info
    @user = User.new
  end

  def save_session1
    #MEMO tr_s!メソッドを使って入力された英数字を半角から全角に変換しています
    user_params[:name_last].tr_s!("0-9a-zA-Z  ()-", "０-９ａ-ｚＡ-Ｚ 　（）－−")
    user_params[:name_first].tr_s!("0-9a-zA-Z  ()-", "０-９ａ-ｚＡ-Ｚ 　（）－−")
    user_params[:name_kana_first].tr_s!("0-9a-zA-Z  ()-", "０-９ａ-ｚＡ-Ｚ 　（）－−")
    user_params[:name_kana_last].tr_s!("0-9a-zA-Z  ()-", "０-９ａ-ｚＡ-Ｚ 　（）－−")
    #MEMO Mojiというgemを使ってユーザーの入力した名前を半角から全角に、カナ文字はひらがなからカタカナに変換しています(日本語に限る)
    user_params[:name_last].replace(Moji.han_to_zen(user_params[:name_last]))
    user_params[:name_first].replace(Moji.han_to_zen(user_params[:name_first]))
    user_params[:name_kana_first].replace(Moji.han_to_zen(user_params[:name_kana_first]))
    user_params[:name_kana_first].replace(Moji.hira_to_kata(user_params[:name_kana_first]))
    user_params[:name_kana_last].replace(Moji.han_to_zen(user_params[:name_kana_last]))
    user_params[:name_kana_last].replace(Moji.hira_to_kata(user_params[:name_kana_last]))

    @user = User.new(user_params)
    #FIXME: @user.valid?がfalseだった場合に右の条件が読まれず、recaptcha用のエラー文が表示されない
    if @user.valid? && verify_recaptcha(model: @user)
      session[:user_session] = user_params
      redirect_to sms_signup_index_path
    else
      #FIXME render時に入力した情報がURLに表示されてしまう
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
      user_params = session[:user_session]
  )

    if @user.save
      session[:id] = @user.id
      sign_in User.find(session[:id]) unless user_signed_in?
      redirect_to user_info_signup_index_path
    else
      render top_signup_index_path
    end
  end

private
  def user_params
    params.require(:user).permit(:name_last, :name_first, :name_kana_last, :name_kana_first, :email, :password, :password_confirmation, :nickname, :birthday)
  end

  def user_signed_in
    if user_signed_in?
      redirect_to root_path
    end
  end
end
