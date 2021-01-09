class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :vehicle_number
      t.references :spot, foreign_key: true
      t.boolean :is_active

      t.timestamps
    end
  end
end
