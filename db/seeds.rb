# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8

Brand.create!(name: "シャネル")
Brand.create!(name: "ナイキ")
Brand.create!(name: "ルイヴィトン")
Brand.create!(name: "シュプリーム")
Brand.create!(name: "アディダス")
Brand.create!(name: "その他")
Category.create!(name: "レディース", ancestry: "sample-ancestry")
Category.create!(name: "メンズ", ancestry: "sample-ancestry")
Category.create!(name: "ベビー・キッズ", ancestry: "sample-ancestry")
Category.create!(name: "インテリア・住まい・小物", ancestry: "sample-ancestry")
Category.create!(name: "本・音楽・ゲーム", ancestry: "sample-ancestry")
Category.create!(name: "おもちゃ・ホビー・グッズ", ancestry: "sample-ancestry")
Category.create!(name: "コスメ・香水・美容", ancestry: "sample-ancestry")
Category.create!(name: "家電・スマホ・カメラ", ancestry: "sample-ancestry")
Category.create!(name: "スポーツ・レジャー", ancestry: "sample-ancestry")
Category.create!(name: "ハンドメイド", ancestry: "sample-ancestry")
Category.create!(name: "チケット", ancestry: "sample-ancestry")
Category.create!(name: "自動車・オートバイ", ancestry: "sample-ancestry")
Category.create!(name: "その他", ancestry: "sample-ancestry")
