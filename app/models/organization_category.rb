class OrganizationCategory < ApplicationRecord

  has_many :organizations
  validates :name, presence: true, length: {maximum: 100}
end
