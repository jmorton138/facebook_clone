class AddReferencesToFriendRequests < ActiveRecord::Migration[6.1]
  def change
    add_reference :friend_requests, :sender, references: :user, index: true
    add_foreign_key :friend_requests, :users, column: :sender_id
  end
end
