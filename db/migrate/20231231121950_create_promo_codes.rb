class CreatePromoCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :promo_codes do |t|
      t.string :code, null: false, default: ''
      t.decimal :usage_limit, null: false, default: 0.0
      t.datetime :expiry_date, null: false, default: DateTime.now
      t.decimal :discount, null: false, default: 0.0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
