class UserDetail < ApplicationRecord
  belongs_to :user, optional: true, dependent: :destroy, foreign_key: "user_id"

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :kana_family_name, presence: true
  validates :kana_first_name, presence: true
  validates :birthday, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10}\z|\A\d{11}\z/ }
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :profile, length: { maximum: 5000 }
end
