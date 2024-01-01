class CreateConversations < ActiveRecord::Migration[6.1]
  def change
    create_table :conversations do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :readStatus, null: false, default: 0

      t.timestamps
    end
  end
end
