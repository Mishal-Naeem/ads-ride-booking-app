class AddUniqueConstraintToForeignKey < ActiveRecord::Migration[6.1]
  def change
    # Add a unique constraint to the foreign key
    remove_index :trips, :ride_request_id
    add_index :trips, :ride_request_id, unique: true
  end
end
