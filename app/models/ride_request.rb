class RideRequest < ApplicationRecord
  belongs_to :user
  has_one :trip
  belongs_to :promo_code, optional: true
  has_one :payment_method

  enum status: [ :pending, :completed, :canceled ]
  enum ride_type: [ :mini, :premium, :auto, :with_ac, :bike ]
end
