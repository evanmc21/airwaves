class User < ApplicationRecord
  has_many :flights
  has_many :airlines, through: :flights
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates_presence_of :first_name, :last_name, :budget


    def self.find_or_create_by_omniauth(auth)
      where(:email => auth["info"]["email"]).first_or_create do |user| #only get user object if it's the first time we're seeing it.
        user.password = SecureRandom.hex
      end
    end

end
