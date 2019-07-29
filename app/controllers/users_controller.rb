class UsersController < ApplicationController

  def show
  end

  def edit
  end

  def profile
  end

  def logout
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
