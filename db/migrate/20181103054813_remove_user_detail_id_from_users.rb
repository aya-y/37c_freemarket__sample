class RemoveUserDetailIdFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :user_detail_id, :integer
  end
end
