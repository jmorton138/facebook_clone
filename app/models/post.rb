class Post < ApplicationRecord
    belongs_to :author, class_name: "User"
    has_many :likes
    has_many :comments
    has_one_attached :photo
end
