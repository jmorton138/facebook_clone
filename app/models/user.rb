class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :sent_requests, foreign_key: :sender_id, class_name: "FriendRequest"
  has_many :received_requests, foreign_key: :recipient_id, class_name: "FriendRequest"
  # has_and_belongs_to_many :friends

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
