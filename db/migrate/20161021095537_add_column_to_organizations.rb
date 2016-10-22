class AddColumnToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :description, :text
  end
end
