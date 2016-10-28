class CreateAbouts < ActiveRecord::Migration[5.0]
  def change
    create_table :abouts do |t|
      t.text :description
      t.string :title
      t.string :meta_title
      t.string :meta_description
      t.string :meta_keywords


      t.timestamps
    end
  end
end
