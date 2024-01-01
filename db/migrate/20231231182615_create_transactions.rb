class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.datetime :trasaction_date_and_time
      t.integer :status, null: false, default: 0
      t.string :stripe_charge_id, default: nil
      t.decimal :amount, null: false, default: 0.0
      t.references :driver, null: false, foreign_key: { to_table: :users }
      t.references :passenger, null: false, foreign_key: { to_table: :users }
      t.references :trip, null: false, foreign_key: true
      t.references :payment_method, null: false, foreign_key: true

      t.timestamps
    end
  end
end
