class AddressesController < ApplicationController

  def new
  end

  def update
  end

  def create
    @address = Address.new(address_params)
    if @address.save
    else
      render "user_info"
    end
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :prefecture, :city, :house_number, :building_name).merge(user_id: current_user.id)
  end

end
