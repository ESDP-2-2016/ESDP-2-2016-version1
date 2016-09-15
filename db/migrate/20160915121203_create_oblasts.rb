class CreateOblasts < ActiveRecord::Migration[5.0]
  def change
    create_table :oblasts do |t|
      t.string :name

      t.timestamps
    end
  end
end
