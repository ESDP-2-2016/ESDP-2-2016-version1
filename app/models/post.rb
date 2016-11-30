class Post < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  belongs_to :post_category
  has_many :post_comments,dependent: :destroy
  has_many :aids

  extend FriendlyId
  friendly_id :title, use: :slugged

  def unshow_aids
    @unshow_posts_aids = Aid.find_by_sql("SELECT * FROM Aids WHERE post_id IN (SELECT id FROM Posts WHERE id = " + self.id.to_s + ") AND status = 0")
  end

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end