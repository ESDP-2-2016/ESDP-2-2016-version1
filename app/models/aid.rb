class Aid < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :organization
  validates :description, presence: true
end
