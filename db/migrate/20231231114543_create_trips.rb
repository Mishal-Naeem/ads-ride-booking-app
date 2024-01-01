class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.decimal :distance, null: false, default: 0.0
      t.datetime :start_time, null: false, default: DateTime.now
      t.integer :status, null: false, default: 0
      t.datetime :end_time, null: false, default: DateTime.now + 1.hour
      t.decimal :amount, null: false, default: 0.0
      t.decimal :discounted_amount,  null: false, default: 0.0
      t.references :driver, null: false, foreign_key: { to_table: :users }
      t.references :passenger, null: false, foreign_key: { to_table: :users }
      t.references :vehicle, null: false, foreign_key: true
      t.references :ride_request, foreign_key: true

      t.timestamps
    end
  end
end
