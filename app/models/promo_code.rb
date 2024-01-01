class PromoCode < ApplicationRecord
  belongs_to :user
  has_many :ride_requests

  enum status: [:available, :used, :expired]
end
