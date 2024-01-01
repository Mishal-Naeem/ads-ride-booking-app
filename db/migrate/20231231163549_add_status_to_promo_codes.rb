class AddStatusToPromoCodes < ActiveRecord::Migration[6.1]
  def change
    add_column :promo_codes, :status, :integer, null: false, default: 0
  end
end
