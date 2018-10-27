class CreateBeds < ActiveRecord::Migration[5.1]
  def change
    create_table :beds do |t|
      t.string :room
      t.boolean :vacant
      t.integer :price
      t.string :tier
      t.string :hospital_id

      t.timestamps
    end
  end
end
