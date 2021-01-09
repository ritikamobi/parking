class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :title
      t.integer :count

      t.timestamps
    end
  end
end
