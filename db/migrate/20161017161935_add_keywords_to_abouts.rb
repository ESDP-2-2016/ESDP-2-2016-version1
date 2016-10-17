class AddKeywordsToAbouts < ActiveRecord::Migration[5.0]
  def change
    add_column :abouts, :keywords, :string
  end
end
