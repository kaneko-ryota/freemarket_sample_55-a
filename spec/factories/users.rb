FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"0000000a"}
    password_confirmation {"0000000a"}
    name_last             {"abe"}
    name_first            {"shin"}
    name_kana_last        {"アベ"}
    name_kana_first       {"シン"}
    birthday              {"2015-12-12"}
  end

end