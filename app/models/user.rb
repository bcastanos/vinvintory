class User < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 30}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 60},
            format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  has_secure_password

  has_many :bottles, dependent: :destroy

end
