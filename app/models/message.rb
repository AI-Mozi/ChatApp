class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room, inverse_of: :messages
  validates :message, presence: true, length: {minimum:1 , maximum: 200}

  def as_json(options)
    super(options).merge(user_avatar_url: user.gravatar_url)
  end

  def display_time
    if self.created_at > (Time.now - 24.hours)
      (self.created_at).strftime('%H:%M')
    else
      (self.created_at).strftime('%e %B %Y at %H:%M')
    end
  end
end
