class CreatePaymentMethods < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_methods do |t|
      t.integer :payment_type, null: false, default: 0
      t.references :user, null: false, foreign_key: true
      t.references :ride_request, null: false, foreign_key: true, index: {unique: true}

      t.timestamps
    end
  end
end
