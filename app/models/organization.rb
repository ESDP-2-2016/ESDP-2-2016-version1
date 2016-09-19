class Organization < ApplicationRecord

  belongs_to :organization_category
  belongs_to :oblast

  validates :name, presence: true, length: {maximum: 250}
  validates :oblast_id, presence: true
  validates :location, presence: true 
  validates :organization_category_id, presence: true

end
