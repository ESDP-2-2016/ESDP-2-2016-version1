class AddTitleToAbouts < ActiveRecord::Migration[5.0]
  def change
    add_column :abouts, :title, :string
  end
end
