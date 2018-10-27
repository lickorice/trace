class AddColumnDistanceToHospitals < ActiveRecord::Migration[5.1]
  def change
    add_column :hospitals, :distance, :integer
  end
end
