class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.datetime :posted
      t.references :organization, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
