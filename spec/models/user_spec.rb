require 'rails_helper'
describe User do
  describe '#create' do
      it "is valid with all" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a name_last " do
      user = build(:user, name_last: "")
      user.valid?
      expect(user.errors[:name_last]).to include("can't be blank")
    end

    it "is invalid without a name_first" do
      user = build(:user, name_first: "")
      user.valid?
      expect(user.errors[:name_first]).to include("can't be blank")
    end

    it "is invalid without a name_kana_last" do
      user = build(:user, name_kana_last: "")
      user.valid?
      expect(user.errors[:name_kana_last]).to include("can't be blank")
    end

    it "is invalid without a name_kana_first" do
      user = build(:user, name_kana_first: "")
      user.valid?
      expect(user.errors[:name_kana_first]).to include("can't be blank")
    end

    it "is invalid without a birthday" do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end
  end
end