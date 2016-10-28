class CreateAbouts < ActiveRecord::Migration[5.0]
  def change
    create_table :abouts do |t|
      t.text :description
      t.string :title
      t.string :keywords

      t.timestamps
    end
  end
end
