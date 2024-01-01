class Conversation < ApplicationRecord
  belongs_to :user
  has_many :messages
  
  enum status: [:unread, :read]
end
