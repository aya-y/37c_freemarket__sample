5.times {
  User.seed do |u|
    u.nickname = Faker::Internet.username(1..6)
    u.email = Faker::Internet.email
    u.password = Faker::Internet.password
  end
}

UserDetail.seed do |u|
  u.id = 1
  u.family_name = "nick"
  u.first_name = "name"
  u.kana_family_name = "ニック"
  u.kana_first_name = "ネーム"
  u.birthday = "2018/10/12"
  u.prefecture = 1
  u.city = "渋谷区"
  u.address = 111
  u.residential_name = "渋谷ビル"
  u.phone_number = 909111
  u.postal_code = 3631111
  u.profile = "こんにちは"
end

LargeCategory.seed(:id,
{id: 1, large_category: "レディース"},
{id: 2, large_category: "メンズ"},
{id: 3, large_category: "ベビー・キッズ"},
{id: 4, large_category: "インテリア・住まい・小物"},
{id: 5, large_category: "本・音楽・ゲーム"},
{id: 6, large_category: "おもちゃ・ホビー・カメラ"},
{id: 7, large_category: "コスメ・香水・美容"},
{id: 8, large_category: "家電・スマホ・カメラ"},
{id: 9, large_category: "スポーツ・レジャー"},
{id: 10, large_category: "ハンドメイド"},
{id: 11, large_category: "チケット"},
{id: 12, large_category: "自動車・オートバイ"},
{id: 13, large_category: "その他"},
  )



MediumCategory.seed(:id,
{id: 1, medium_category: "トップス"},
{id: 2, medium_category: "ジャケット/アウター"},
{id: 3, medium_category: "パンツ"},
{id: 4, medium_category: "スカート"},
{id: 5, medium_category: "ワンピース"},
{id: 6, medium_category: "靴"},
{id: 7, medium_category: "ルームウェア/パジャマ"},
{id: 8, medium_category: "レッグウェア"},
{id: 9, medium_category: "帽子"},
{id: 10, medium_category: "バッグ"},
{id: 11, medium_category: "アクセサリー"},
{id: 12, medium_category: "ヘアアクセサリー"},
{id: 13, medium_category: "小物"},
{id: 14, medium_category: "時計"},
  )



SmallCategory.seed(:id,
{id: 1, small_category: "Tシャツ/カットソー(半袖/袖なし)"},
{id: 2, small_category: "Tシャツ/カットソー(七分/長袖)"},
{id: 3, small_category: "シャツ/ブラウス(半袖/袖なし)"},
{id: 4, small_category: "シャツ/ブラウス（七分/長袖)"},
{id: 5, small_category: "ポロシャツ"},
{id: 6, small_category: "キャミソール"},
{id: 7, small_category: "タンクトップ"},
{id: 8, small_category: "ホルターネック"},
{id: 9, small_category: "ニット/セーター"},
{id: 10, small_category: "チェニック"},
{id: 11, small_category: "カーディガン/ボレロ"},
{id: 12, small_category: "アンサンブル"},
{id: 13, small_category: "ベスト/ジレ"},
{id: 14, small_category: "パーカー"},
{id: 15, small_category: "トレーナー/スウェット"},
{id: 16, small_category: "ベアトップ/チューブトップ"},
{id: 17, small_category: "ジャージ"},
{id: 18, small_category: "その他"},
  )


