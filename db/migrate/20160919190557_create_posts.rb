class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.boolean :open, default: true
      t.references :organization, foreign_key: true
      t.references :post_category, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
