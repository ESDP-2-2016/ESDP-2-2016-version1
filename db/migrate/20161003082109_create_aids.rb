class CreateAids < ActiveRecord::Migration[5.0]
  def change
    create_table :aids do |t|
      t.text :description
      t.integer :status
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
