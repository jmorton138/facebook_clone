class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :sent_requests, foreign_key: :sender_id, class_name: "FriendRequest"
  has_many :received_requests, foreign_key: :recipient_id, class_name: "FriendRequest"
  
  has_many :follower_friendships, class_name: "Friendship", foreign_key: :followee_id
  has_many :followers, class_name: "User", through: :follower_friendships, source: :follower

  has_many :followee_friendships, class_name: "Friendship", foreign_key: :follower_id
  has_many :followees, class_name: "User", through: :followee_friendships, source: :followee


  has_many :authored_posts, class_name: "Post", foreign_key: :author_id, dependent: :destroy

  has_many :likes, foreign_key: :liker_id

  has_one_attached :avatar
  devise :omniauthable, omniauth_providers: %i[facebook]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      # user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
end
        
end
