class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :followers, foreign_key: "followee_id", class_name: 'Follow'
  has_many :following, foreign_key: "follower_id", class_name: 'Follow'
  validates :email, uniqueness: { case_sensitive: true }
  validates :email, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
