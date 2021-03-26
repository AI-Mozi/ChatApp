class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room, inverse_of: :messages
  validates :message, presence: true, length: {minimum:1 , maximum: 200}

  def as_json(options)
    super(options).merge(user_avatar_url: user.gravatar_url)
  end
end
