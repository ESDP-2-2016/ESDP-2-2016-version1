class Post < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  belongs_to :post_category
  has_many :post_comments,dependent: :destroy
end
