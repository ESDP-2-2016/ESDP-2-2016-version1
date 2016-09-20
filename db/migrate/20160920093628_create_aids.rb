class CreateAids < ActiveRecord::Migration[5.0]
  def change
    create_table :aids do |t|
      t.references :organization, foreign_key: true
      t.references :donor, foreign_key: true
      t.references :aid_category, foreign_key: true
      t.text :description
      t.datetime :date_time_published
      t.datetime :date_time_delivered
      t.boolean :aid_delivered
      t.text :result
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
