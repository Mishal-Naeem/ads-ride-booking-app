class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :body, null: false
      t.references :sender, null: false, foreign_key: true
      t.references :conversation, null: false, foreign_key: true
      t.references :reciever, null: false, foreign_key: true

      t.timestamps
    end
  end
end
