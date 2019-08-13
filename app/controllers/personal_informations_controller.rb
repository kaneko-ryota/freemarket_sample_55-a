class PersonalInformationsController < ApplicationController

  def index
    # MEMO: ユーザーが本人登録を行なっていた場合はidで取得後に編集を可能にし、していない場合は新規で作成する
    if @personal_information = PersonalInformation.find_by(user_id: current_user.id)
    else
      @personal_information = PersonalInformation.new
    end
  end

  def create
    @personal_information = PersonalInformation.new(personal_information_params)
    if @personal_information.save
      # MEMO: flashメッセージ表示予定
      render :index
    else
      # MEMO: flashメッセージ表示予定
      render :index
    end
  end

  def update
    @personal_information = PersonalInformation.find_by(user_id: current_user.id)
    if @personal_information.update(personal_information_params)
      # MEMO: flashメッセージ表示予定
      render :index
    else
      # MEMO: flashメッセージ表示予定
      render :index
    end
  end

  private
  def personal_information_params
    params.require(:personal_information).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name).merge(user_id: current_user.id, name_last: current_user.name_last, name_first: current_user.name_first, name_kana_last: current_user.name_kana_last, name_kana_first: current_user.name_kana_first, birthday: current_user.birthday)
  end
end
