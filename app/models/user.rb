class User < ApplicationRecord
  has_many :twitter_datum

  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :category, presence: true
  validates :kind, presence: true

  def to_s
    "#{first_name} #{last_name}"
  end
end
