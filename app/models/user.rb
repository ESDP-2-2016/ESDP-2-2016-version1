class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_organizations
  has_many :organizations, :through => :user_organizations
  has_many :posts
  has_many :post_comments
  has_many :aids
  validates :phone, phone: true
  validates :name, presence: true, length: {maximum: 60}

  extend FriendlyId
  friendly_id :name, use: :slugged

  def unread_aids
    @user_posts_aids = Aid.find_by_sql("SELECT * FROM Aids WHERE post_id IN (SELECT id FROM Posts WHERE user_id = " + self.id.to_s + ") AND status = 0")
  end
  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end

