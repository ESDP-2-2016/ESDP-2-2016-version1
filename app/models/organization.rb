class Organization < ApplicationRecord

  after_initialize :set_defaults, unless: :persisted?

  belongs_to :organization_category
  belongs_to :oblast

  has_many :user_organizations
  has_many :posts
  has_many :users, :through => :user_organizations,dependent: :destroy
  has_many :aids
  validates :phone, phone: true
  validates :name, presence: true, length: {maximum: 250}
  validates :address, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :oblast_id, presence: true
  validates :location, presence: true 
  validates :organization_category_id, presence: true

  def set_defaults
    self.active = false if self.active.nil?
  end

  extend FriendlyId
  friendly_id :name, use: :slugged
end
