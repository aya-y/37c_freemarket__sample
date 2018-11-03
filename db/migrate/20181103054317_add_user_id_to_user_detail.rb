class AddUserIdToUserDetail < ActiveRecord::Migration[5.1]
  def change
    add_column :user_details, :user_id, :integer
  end
end
