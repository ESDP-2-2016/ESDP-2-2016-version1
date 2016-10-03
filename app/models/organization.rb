class Organization < ApplicationRecord

  after_initialize :set_defaults, unless: :persisted?

  belongs_to :organization_category
  belongs_to :oblast

  has_many :user_organizations
  has_many :posts, dependent: :destroy
  has_many :users, :through => :user_organizations,dependent: :destroy
  has_many :aids


  validates :name, presence: true, length: {maximum: 250}
  validates :oblast_id, presence: true
  validates :location, presence: true 
  validates :organization_category_id, presence: true


  def set_defaults
    self.active = false if self.active.nil?
  end

end
