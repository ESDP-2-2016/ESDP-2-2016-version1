class AddNewfieldsToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :url, :string
    add_column :organizations, :active, :boolean
  end
end
