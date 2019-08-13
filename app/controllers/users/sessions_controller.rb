# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  prepend_before_action :check_captcha, only: [:create]
  after_filter :delete_flash, only: [:create, :destory]


  def new
    @user = User.new
    super
  end


  def create
    super
  end

  private
  def check_captcha
    unless verify_recaptcha
      self.resource = resource_class.new
      resource.validate
      render :new
    end
  end
  
  protected
  def delete_flash
    if flash[:notice].present?
      flash.delete(:notice)
    end
  end
end
