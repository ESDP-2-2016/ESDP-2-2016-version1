class Post < ApplicationRecord
  belongs_to :organization
  belongs_to :category
  belongs_to :post_category
end
