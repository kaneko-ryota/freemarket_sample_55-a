FactoryBot.define do

  factory :personal_information do
    user_id               {1}
    postal_code           {"222-2222"}
    prefecture_id         {20}
    city                  {"東京都"}
    house_number          {"1-1-1"}
    association :user, factory: :user
  end

end