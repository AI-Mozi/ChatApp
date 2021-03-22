class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user, inverse_of: :message
end
