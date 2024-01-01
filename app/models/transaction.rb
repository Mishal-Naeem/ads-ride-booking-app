class Transaction < ApplicationRecord
  belongs_to :driver, class_name: 'User'
  belongs_to :passenger, class_name: 'User'
  belongs_to :payment_method
  has_one :refund
  
  enum status: [:pending, :completed, :failed]
end
