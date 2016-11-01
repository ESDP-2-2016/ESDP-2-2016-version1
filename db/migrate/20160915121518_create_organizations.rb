class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :description
      t.string :keywords
      t.string :location
      t.string :address
      t.string :phone
      t.string :longitude
      t.string :latitude
      t.string :contact_person
      t.boolean :active
      t.string :url
      t.references :organization_category, foreign_key: true
      t.references :oblast, foreign_key: true

      t.timestamps
    end
  end
end
