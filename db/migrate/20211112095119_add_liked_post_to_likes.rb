class AddLikedPostToLikes < ActiveRecord::Migration[6.1]
  def change
    add_reference :likes, :post, index: true
    add_foreign_key :likes, :posts, column_id: :post_id
  end
end
