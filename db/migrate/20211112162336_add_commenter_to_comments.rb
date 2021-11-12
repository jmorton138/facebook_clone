class AddCommenterToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :commenter, references: :user, index: true
    add_foreign_key :comments, :users, column: :commenter_id
  end
end
