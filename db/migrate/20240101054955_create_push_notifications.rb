class CreatePushNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :push_notifications do |t|
      t.text :content
      t.string :other_attributes

      t.timestamps
    end
  end
end
