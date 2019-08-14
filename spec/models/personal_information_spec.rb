require 'rails_helper'
describe PersonalInformation do
  describe '#create' do
    it "全てのデータが存在したら保存ができる" do
      personal_information = build(:personal_information)
      expect(personal_information).to be_valid
    end

    it "紐づいているユーザーIDが空だったら保存できない" do
      user = build(:personal_information, user_id: "")
      user.valid?
      expect(user.errors[:user_id])
    end

    it "郵便番号が空だったら保存できない" do
      user = build(:personal_information, postal_code: "")
      user.valid?
      expect(user.errors[:postal_code]).to include("を入力してください。")
    end

    it "都道府県が空だったら保存できない" do
      user = build(:personal_information, prefecture_id: "")
      user.valid?
      expect(user.errors[:prefecture_id]).to include("を選択してください。")
    end

    it "市区町村が空だったら保存できない" do
      user = build(:personal_information, city: "")
      user.valid?
      expect(user.errors[:city]).to include("を入力してください。")
    end

    it "番地が空だったら保存できない" do
      user = build(:personal_information, house_number: "")
      user.valid?
      expect(user.errors[:house_number]).to include("を入力してください。")
    end

  end
end