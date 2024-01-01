class PaymentMethod < ApplicationRecord
  belongs_to :user
  has_many :transactions
  belongs_to :ride_request

  enum payment_type: [:cash, :card, :wallet]
end
