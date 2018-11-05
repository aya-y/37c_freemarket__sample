 FactoryGirl.define do

   factory :item do
      id                     "1"
      item_name              "良い服"
      description            "良い服です。"
      size                   "M"
      condition              "新品、未使用"
      charge_method          "送料込み(出品者負担)"
      prefecture             "北海道"
      handling_time          "1~2日で発送"
      price                  "3000"
      delivery_method        "未定"
      user
      small_category
      medium_category
      large_category
   end

end
