class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room, inverse_of: :messages
  validates :message, presence: true, unless: :image_data, length: {minimum:1 , maximum: 200}

  include ImageUploader[:image]

  def as_json(options)
    super(options).merge(user_avatar_url: user.gravatar_url)
  end

  def display_time
    creation_time = self.created_at
    if creation_time > (Time.now - 24.hours)
      creation_time.strftime('%H:%M')
    elsif creation_time > (Time.now - 48.hours)
      "Yesterday"
    else
      creation_time.strftime('%e %B %Y at %H:%M')
    end
  end
end
