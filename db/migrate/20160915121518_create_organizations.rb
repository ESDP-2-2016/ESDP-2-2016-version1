class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :city_or_village
      t.string :address
      t.string :contact_person
      t.string :phone
      t.string :longitude
      t.string :latitude
      t.references :organization_category, foreign_key: true
      t.references :oblast, foreign_key: true

      t.timestamps
    end
  end
end
