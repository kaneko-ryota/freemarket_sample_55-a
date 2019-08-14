require 'rails_helper'
describe User do
  describe '#create' do
    it "全てのデータが存在したら保存できる" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "ニックネームが空だったら保存できない" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください。")
    end

    it "メールアドレスが空だったら保存できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください。")
    end

    it "名字が空だったら保存できない" do
      user = build(:user, name_last: "")
      user.valid?
      expect(user.errors[:name_last]).to include("を入力してください。")
    end

    it "名前が空だったら保存できない" do
      user = build(:user, name_first: "")
      user.valid?
      expect(user.errors[:name_first]).to include("を入力してください。")
    end

    it "名字のフリガナが空だったら保存できない" do
      user = build(:user, name_kana_last: "")
      user.valid?
      expect(user.errors[:name_kana_last]).to include("を入力してください。")
    end

    it "名前のフリガナが空だったら保存できない" do
      user = build(:user, name_kana_first: "")
      user.valid?
      expect(user.errors[:name_kana_first]).to include("を入力してください。")
    end

    it "誕生日が空だったら保存できない" do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください。")
    end
  end
end