class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.references :organization, foreign_key: true
      t.references :post_category, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
