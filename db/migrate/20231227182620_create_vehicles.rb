class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :VIN_NUM, null: false, default: ''
      t.string :color, null: false, default: ''
      t.string :plate_num, null: false, default: ''
      t.string :model, null: false, default: ''
      t.string :brand, null: false, default: ''
      t.integer :year, null: false, default: 0000
      t.boolean :is_available, null: false, default: false
      t.references :vehicle_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
