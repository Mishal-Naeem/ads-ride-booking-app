class CreateVehicleTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicle_types do |t|
      t.string :name, null: false, default: ''
      t.string :engine_size, null: false, default: ''
      t.integer :seating_capacity, null: false, default: 1
      t.string :description, null: false, default: ''
      t.string :fuel_type, null: false, default: ''

      t.timestamps
    end
  end
end
