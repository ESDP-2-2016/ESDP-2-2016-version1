class RemoveCityOrVillageFromOrganizations < ActiveRecord::Migration[5.0]
  def change
    remove_column :organizations, :city_or_village, :string
  end
end
