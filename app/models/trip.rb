class Trip < ApplicationRecord
  belongs_to :driver, class_name: 'User'
  belongs_to :passenger, class_name: 'User'
  belongs_to :ride_request
  belongs_to :vehicle

  enum status: { pending: 0, completed: 1, canceled: 2 }
end
