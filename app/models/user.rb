class User < ApplicationRecord
  has_many :twitter_datum

  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :category, presence: true
  validates :kind, presence: true

  # Not sure what this does.  It came from following Stefan's tutorial...
  def to_s
    "#{first_name} #{last_name}"
  end

  def self.genders
    %w(Any M F)
  end

  def self.categories
    %w(Any Art Adventure Beauty Blogger Business Comedy Dads DIY Entrepreneur Fashion Family Fitness Foodie Gaming Home Kids Lifestyle Modeling Moms Motivation Movies Music Outdoor Pets Photography Politics Sports Technology Travel Wedding)
  end

  def self.ages
    %w(Any Under\ 25 26-35 36-45 46-55 55+)
  end

end
