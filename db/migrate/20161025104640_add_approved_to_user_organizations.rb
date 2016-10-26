class AddApprovedToUserOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :user_organizations, :approved, :boolean, default: false
  end
end
