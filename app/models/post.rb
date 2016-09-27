class Post < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  belongs_to :post_category

end
