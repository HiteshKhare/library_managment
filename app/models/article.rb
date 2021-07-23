class Article < ApplicationRecord
	include Visible
  has_one_attached :avatar
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
