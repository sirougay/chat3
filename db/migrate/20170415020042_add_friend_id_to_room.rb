class AddFriendIdToRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :friend_id, :integer
  end
end
