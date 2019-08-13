class SignupController < ApplicationController

  require "moji"

  before_action :user_signed_in, only: [:save_session1, :sms, :sms, :sms_authentication]

  def top
  end


  def member_info
    @user = User.new
    # MEMO: step_numを与えることでユーザー登録時のプログレスバーがいまどこのページいるのかが判断できるようになります
    @step_num = 0
  end


  def save_session1
    #MEMO: tr_s!メソッドを使って入力された英数字を半角から全角に変換しています
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
      @step_num = 1
      redirect_to sms_signup_index_path
    else
      #FIXME render時に入力した情報がURLに表示されてしまう
      @step_num = 0
      render 'member_info'
    end
  end


  def sms
    @user = User.new
    @step_num = 1
  end


  def sms_authentication
    @user = User.new
    @step_num = 1

    session[:user_session] = session[:user_session].merge(phone_number: user_phone_params[:phone_number])

    # MEMO: 認証番号の発行とユーザーが入力した電話番号(日本に限る)を国番号付きに変換、またclass変数を使うことで認証番号がアクションごとにリセットされないようにしています
    @@generate_token = ((0..9).to_a + ("a".."z").to_a + ("A".."Z").to_a).sample(4).join
    @user_phone_number = "+81#{user_phone_params[:phone_number][1..-1]}"

    # MEMO: SMSを送信できる回数/電話番号が限られているのでコメントアウトしてあります
    # client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'])
    # client.messages.create(
    #   from: ENV['TWILIO_NUMBER'],
    #   to: @user_phone_number,
    #   body: @@generate_token
    # )
  end


  def user_info
    @address = Address.new
    @step_num = 2
  end


  def credit
    @credit = Credit.new
    @step_num = 3
  end


  def complete
    sign_in User.find(session[:id]) unless user_signed_in?
    @step_num = 4
  end


  def create
    @user = User.new(user_params = session[:user_session])
    # MEMO: 開発用のパスワードで認証を通れるようにしています
    #FIXME?: @user.saveをif文の条件にするとemailがbinaryになってしまうのでtrue内に移動しています、原因の究明が必要
    if verification_params[:verification_code_confirmation] == "777" || verification_params[:verification_code_confirmation] == @@generate_token
      @user.save
      session[:id] = @user.id
      sign_in User.find(session[:id]) unless user_signed_in?
      redirect_to user_info_signup_index_path
    else
      @step_num = 1
      @user.errors.add(:verification_code_confirmation)
      render sms_authentication_signup_index_path
    end
  end
  


private
  def user_params
    params.require(:user).permit(:name_last, :name_first, :name_kana_last, :name_kana_first, :email, :password, :password_confirmation, :nickname, :birthday, :phone_number)
  end

  def verification_params
    params.require(:user).permit(:verification_code_confirmation)
  end

  def user_phone_params
    params.require(:user).permit(:phone_number)
  end

  def user_signed_in
    if user_signed_in?
      redirect_to root_path
    end
  end
end
