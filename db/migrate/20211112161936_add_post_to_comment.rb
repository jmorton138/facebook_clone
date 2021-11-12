class AddPostToComment < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :post, index: true
    add_foreign_key :comments, :posts, column: :post_id
  end
end
