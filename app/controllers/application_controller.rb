class ApplicationController < ActionController::Base

  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def production?
    Rails.env.production?
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def set_search
    @q = Product.search(params[:q])
    if params[:q]
      @products = @q.result.page(params[:page]).per(24).order("id DESC").where(trade_status: 0)
    else
      @products = Product.where(trade_status: 0)
    end
    @count = @products.count
  end
end
