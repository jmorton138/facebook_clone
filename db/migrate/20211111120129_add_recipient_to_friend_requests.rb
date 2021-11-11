class AddRecipientToFriendRequests < ActiveRecord::Migration[6.1]
  def change

    add_reference :friend_requests, :recipient, references: :user, index: true

    add_foreign_key :friend_requests, :users, column: :recipient_id
  end
end
