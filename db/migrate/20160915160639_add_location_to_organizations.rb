class AddLocationToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :location, :string
  end
end
