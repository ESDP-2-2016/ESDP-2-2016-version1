class Post < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  belongs_to :post_category
  has_many :post_comments,dependent: :destroy
  has_many :aids

  extend FriendlyId
  friendly_id :title, use: :slugged
end