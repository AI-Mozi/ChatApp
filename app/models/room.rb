class Room < ApplicationRecord
  has_many :messages, dependent: :destroy,
                        inverse_of: :room
  validates :name, presence: true, length: {minimum: 1, maximum: 34}
end
