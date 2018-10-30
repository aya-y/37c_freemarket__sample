require 'rails_helper'
describe Item do
  describe '#create' do
    it "is invalid without a item_name" do
     item = Item.new(item_name: "", description: "シャツ", size: "L", condition: "新品、未使用", charge_method: "送料込み(出品者負担)",prefecture: "北海道",handling_time: "1~2日で発送",price: 3000,user_id: 1,large_category_id: 1,medium_category_id: 1,small_category_id: 1)
     user.valid?
     expect(item.errors[:item_name]).to include("can't be blank")
    end
  end
end
