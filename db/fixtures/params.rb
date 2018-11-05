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
  )


MediumCategory.seed(:id,
{id: 1, medium_category: "トップス"},
{id: 2, medium_category: "ジャケット/アウター"},
  )



SmallCategory.seed(:id,
{id: 1, small_category: "Tシャツ/カットソー(半袖/袖なし)"},
{id: 2, small_category: "Tシャツ/カットソー(七分/長袖)"},
  )


