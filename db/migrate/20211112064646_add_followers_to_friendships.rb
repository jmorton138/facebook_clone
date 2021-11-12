class AddFollowersToFriendships < ActiveRecord::Migration[6.1]
  def change
    add_reference :friendships, :follower, references: :user, index: true
    add_foreign_key :friendships, :users, column: :follower_id
  end
end
