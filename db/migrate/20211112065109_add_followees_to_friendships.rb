class AddFolloweesToFriendships < ActiveRecord::Migration[6.1]
  def change
    add_reference :friendships, :followee, references: :user, index: true
    add_foreign_key :friendships, :users, column: :followee_id
  end
end
