class Post < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  belongs_to :post_category
  has_many :post_comments,dependent: :destroy
  has_many :aids

  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end