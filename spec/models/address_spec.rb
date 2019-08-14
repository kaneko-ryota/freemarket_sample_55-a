require 'rails_helper'
describe Address do
  describe '#create' do
    it "全てのデータが存在したら保存できる" do
      address = build(:address)
      expect(address).to be_valid
    end

    it "名字が空だったら保存できない" do
      user = build(:address, name_last: "")
      user.valid?
      expect(user.errors[:name_last]).to include("を入力してください。")
    end

    it "名前が空だったら保存できない" do
      user = build(:address, name_first: "")
      user.valid?
      expect(user.errors[:name_first]).to include("を入力してください。")
    end

    it "名字のフリガナが空だったら保存できない" do
      user = build(:address, name_kana_last: "")
      user.valid?
      expect(user.errors[:name_kana_last]).to include("を入力してください。")
    end

    it "紐づいているユーザーIDが空だったら保存できない" do
      user = build(:address, user_id: "")
      user.valid?
      expect(user.errors[:user_id])
    end

    it "郵便番号が空だったら保存できない" do
      user = build(:address, postal_code: "")
      user.valid?
      expect(user.errors[:postal_code ]).to include("を入力してください。")
    end

    it "都道府県が空だったら保存できない" do
      user = build(:address, prefecture_id: "")
      user.valid?
      expect(user.errors[:prefecture_id]).to include("を選択してください。")
    end

    it "市区町村が空だったら保存できない" do
      user = build(:address, city: "")
      user.valid?
      expect(user.errors[:city]).to include("を入力してください。")
    end

    it "名前のフリガナが空だったら保存できない" do
      user = build(:address, name_kana_first: "")
      user.valid?
      expect(user.errors[:name_kana_first]).to include("を入力してください。")
    end

    it "マンション名が空でも保存できる" do
      user = build(:address, house_number: "")
      user.valid?
    end

  end
end