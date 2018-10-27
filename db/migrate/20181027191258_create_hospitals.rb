class CreateHospitals < ActiveRecord::Migration[5.1]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.text :contact
      t.string :hospital_id

      t.timestamps
    end
  end
end
