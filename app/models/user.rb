class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         
  validates :username, uniqueness: true, presence: true

  def gravatar_url
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "https://gravatar.com/avatar/#{gravatar_id}.png"
  end

  def online?
    $redis_onlines.exists( self.id )
  end
end
