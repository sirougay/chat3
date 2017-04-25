class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :active_friends, class_name: "Friend",
  					foreign_key: "follower_id",
  					dependent: :destroy
  has_many :passive_friends, class_name: "Friend",
  					foreign_key: "followed_id",
  					dependent: :destroy
  has_many :following, through: :active_friends, source: :followed
  has_many :followers, through: :passive_friends, source: :follower
  has_many :messages
  has_many :room_members
  has_many :rooms, through: :room_members
  mount_uploader :picture, ::PictureUploader
  validates :name, presence: true


  def follow(other_user)
  	active_friends.create(followed_id: other_user.id)
  end

  def following?(other_user)
  	following.include?(other_user)
  end

end
