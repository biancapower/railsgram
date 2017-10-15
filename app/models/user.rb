class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :photos
  has_one :profile
  acts_as_voter

  has_and_belongs_to_many :followers,
      class_name: "User",
      foreign_key: "followed_id",
      association_foreign_key: "follower_id",
      join_table: "followers"

  has_and_belongs_to_many :following,
      class_name: "User",
      foreign_key: "follower_id",
      association_foreign_key: "followed_id",
      join_table: "followers"

  def followed_by?(user)
    followers.include?(user)
  end

  def following?(user)
    following.include?(user)
  end
end
