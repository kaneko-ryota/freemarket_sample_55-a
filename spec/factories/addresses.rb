FactoryBot.define do

  factory :address do
    name_last             {"abe"}
    name_first            {"shin"}
    name_kana_last        {"アベ"}
    name_kana_first       {"シン"}
    user_id               {1}
    postal_code           {"222-2222"}
    prefecture_id         {20}
    city                  {"東京都"}
    house_number          {"1-1-1"}
    association :user, factory: :user
  end

end