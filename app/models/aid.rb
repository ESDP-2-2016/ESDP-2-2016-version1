class Aid < ApplicationRecord
  belongs_to :organization
  belongs_to :donor
  belongs_to :aid_category
  belongs_to :post
end
