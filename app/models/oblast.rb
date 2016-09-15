class Oblast < ApplicationRecord
  has_many :organizations
  validates :name, presence: true, length: {maximum: 50}
end
