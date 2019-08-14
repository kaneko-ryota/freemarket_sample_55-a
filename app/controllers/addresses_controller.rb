class AddressesController < ApplicationController

  def index
    # MEMO: ユーザーが住所登録を行なっていた場合はidで取得後に編集を可能にし、していない場合は新規で作成する
    @address = Address.find_or_initialize_by(user_id: current_user.id)

  end


  def update
    @address = Address.find_by(user_id: current_user.id)
    if @address.update(address_params)
      # MEMO: flashメッセージ表示予定
      redirect_to addresses_path, notice: "変更しました。"
    else
      # MEMO: flashメッセージ表示予定
      render :index
    end
  end

  def create
    # MEMO: 郵便番号のみ半角から全角に変換
    address_params[:postal_code].replace(address_params[:postal_code].tr("０-９ 　（）－−", "0-9  ()-"))

    address_params[:name_last].replace(Moji.han_to_zen(address_params[:name_last]))
    address_params[:name_first].replace(Moji.han_to_zen(address_params[:name_first]))

    address_params[:name_kana_first].replace(Moji.han_to_zen(address_params[:name_kana_first]))
    address_params[:name_kana_first].replace(Moji.hira_to_kata(address_params[:name_kana_first]))

    address_params[:name_kana_last].replace(Moji.han_to_zen(address_params[:name_kana_last]))
    address_params[:name_kana_last].replace(Moji.hira_to_kata(address_params[:name_kana_last]))

    @address = Address.new(address_params)
    if @address.save
      redirect_to complete_signup_index_path
    else
      render user_info_signup_index_path
    end
  end

  private
  def address_params
    params.require(:address).permit(:name_last, :name_first, :name_kana_last, :name_kana_first, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end

end
