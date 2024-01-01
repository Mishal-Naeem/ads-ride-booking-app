class PushNotification < ApplicationRecord
  has_many :notifications, as: :notifiable
end
