class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false, default: ''
      t.string :last_name, null: false, default: ''
      t.string :email, null: false, default: ''
      t.string :address, null: false, default: ''
      t.string :phn_num, null: false, default: ''
      t.string :city, null: false, default: ''
      t.string :password, null: false, default: ''
      t.string :type, null: false, default: 'passenger'

      t.timestamps
    end
  end
end
