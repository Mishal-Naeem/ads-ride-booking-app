class CreateRideRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :ride_requests do |t|
      t.string :source, null: false, default: ''
      t.string :destination, null: false, default: ''
      t.integer :ride_type, null: false, default: 0
      t.decimal :estimated_amount, null: false, default: 0.0
      t.integer :status, null: false, default: 0
      t.datetime :datetime, null: false, default: DateTime.now
      t.references :user, null: false, foreign_key: true
      t.references :promo_code, foreign_key: true

      t.timestamps
    end
  end
end
