class CreateWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets do |t|
      t.references :user, null: false, foreign_key: true
      t.float :balance, null: false, balance: 0.0
      t.string :currency, null:false, default: 'PKR'

      t.timestamps
    end
  end
end
