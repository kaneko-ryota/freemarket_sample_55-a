class UsersController < ApplicationController

  def show
  end

  def edit
  end

  def registration_top
  end

  def member_info
  end

  def profile
  end

  def phone_number
  end

  def complete
  end

  def logout
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
