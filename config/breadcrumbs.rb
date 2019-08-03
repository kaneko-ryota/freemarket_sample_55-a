crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do |user|
  link "マイページ", user_path(current_user)
end

crumb :detail do |product|
  link product.name, product_path(product)
end

crumb :profile do
  link "プロフィール", profile_users_path
  parent :mypage
end

crumb :credit do
  link "支払い方法", new_credits_path
  parent :mypage
end

crumb :registration do
  link "本人情報の登録", user_registrations_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_users_path
  parent :mypage
end

crumb :category do
  link "カテゴリー一覧", categories_path
end

crumb :categorydetail do |category|
  link "category", category_path
  parent :category
end


