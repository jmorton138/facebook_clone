class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :sent_requests, foreign_key: :sender_id, class_name: "FriendRequest"
  has_many :received_requests, foreign_key: :recipient_id, class_name: "FriendRequest"
  
  has_many :follower_friendships, class_name: "Friendship", foreign_key: :follower_id
  has_many :followers, class_name: "User", through: :follower_friendships, source: :follower

  has_many :followee_friendships, class_name: "Friendship", foreign_key: :followee_id
  has_many :followees, class_name: "User", through: :followee_friendships, source: :followee

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
