class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.boolean :is_read
      t.references :notifiable, polymorphic: true, null: false


      t.timestamps
    end
  end
end
