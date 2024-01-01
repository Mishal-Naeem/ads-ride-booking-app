class Refund < ApplicationRecord
  belongs_to :user
  belongs_to :original_transaction, class_name: 'Transaction', foreign_key: 'transaction_id'

  enum status: [ :pending, :completed, :canceled ]
end
