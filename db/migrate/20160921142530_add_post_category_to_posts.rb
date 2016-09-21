class AddPostCategoryToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :post_category, foreign_key: true
  end
end
