class User < ApplicationRecord
  has_many :vehicles
  has_many :ride_requests
  has_many :driver_trips, class_name: 'Trip', foreign_key: 'driver_id'
  has_many :passenger_trips, class_name: 'Trip', foreign_key: 'passenger_id'
  has_many :driver_transactions, class_name: 'Transaction', foreign_key: 'driver_id'
  has_many :passenger_transactions, class_name: 'Transaction', foreign_key: 'passenger_id'
  has_many :promo_codes
  has_many :payment_methods
  has_many :refunds
  has_one  :wallet
  has_many :reviews
  has_many :reviewer, class_name: 'Review', foreign_key: 'reviewer_id'
  has_many :notifications
  has_many :conversations
  has_many :reciever_messages, class_name: 'Message', foreign_key: 'reciever_id'
  has_many :sender_messages, class_name: 'Message', foreign_key: 'sender_id'
end
