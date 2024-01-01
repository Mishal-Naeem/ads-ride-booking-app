class CreateRefunds < ActiveRecord::Migration[6.1]
  def change
    create_table :refunds do |t|
      t.references :user, null: false, foreign_key: true
      t.references :transaction, null: false, foreign_key: true, index: {unique: true}
      t.decimal :amount, null: false, default: 0.0
      t.string :reason, null: false, default: ''
      t.integer :status, null: false, default: 0
      t.datetime :request_date, null: false, default: DateTime.now

      t.timestamps
    end
  end
end
