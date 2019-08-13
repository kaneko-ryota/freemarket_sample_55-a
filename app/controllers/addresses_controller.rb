class AddressesController < ApplicationController

  def new
  end

  def update
  end

  def create
    # MEMO: 郵便番号のみ半角から全角に変換
    address_params[:postal_code].replace(address_params[:postal_code].tr("０-９ 　（）－−", "0-9  ()-"))
    @address = Address.new(address_params)
    if @address.save
      redirect_to complete_signup_index_path
    else
      render user_info_signup_index_path
    end
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name).merge(user_id: current_user.id)
  end

end
