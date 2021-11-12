class AddPostToLikes < ActiveRecord::Migration[6.1]
  def change
    add_reference :likes, :liker, references: :user, index: true
    add_foreign_key :likes, :users, column: :liker_id
  end
end
