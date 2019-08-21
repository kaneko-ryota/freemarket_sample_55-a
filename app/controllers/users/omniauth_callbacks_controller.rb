class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google_oauth2)
  end

  def callback_for(provider)
    @user = User.find_oauth(request.env["omniauth.auth"])
    if @user.present?
      sign_in_and_redirect @user, event: :authentication
    else
      session[:nickname] = request.env["omniauth.auth"].info.name
      session[:email] = request.env["omniauth.auth"].info.email
      session[:uid] = request.env["omniauth.auth"].uid
      session[:provider] = provider.to_s

      # MEMO: validation突破用にパスワードを仮設定
      session[:password] = "1111111a"

      redirect_to member_info_signup_index_path
    end
  end

  def failure
    redirect_to root_path
  end
end