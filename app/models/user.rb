class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :active_friends, class_name: "Friend",
  					foreign_key: "follower_id",
  					dependent: :destroy
  has_many :passive_friends, class_name: "Friend",
  					foreign_key: "follower_id",
  					dependent: :destroy
  has_many :following, through: :active_friends, source: :followed
  has_many :followers, through: :passive_friends, source: :follower

  def follow(other_user)
  	active_friends.create(followed_id: other_user.id)
  end

  def following?(other_user)
  	following.include?(other_user)
  end
end
