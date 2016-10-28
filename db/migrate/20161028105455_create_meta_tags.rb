class CreateMetaTags < ActiveRecord::Migration[5.0]
  def change
    create_table :meta_tags do |t|
      t.string :title
      t.string :keywords
      t.text :description

      t.timestamps
    end
  end
end
