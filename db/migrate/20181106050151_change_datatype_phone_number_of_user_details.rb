class ChangeDatatypePhoneNumberOfUserDetails < ActiveRecord::Migration[5.1]
  def change
      change_column :user_details, :phone_number, :text
  end
end
