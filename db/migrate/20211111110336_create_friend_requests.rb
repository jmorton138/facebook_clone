class CreateFriendRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :friend_requests do |t|
      t.boolean :pending, default: true
      t.timestamps
    end
  end
end
