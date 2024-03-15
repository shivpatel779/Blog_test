require 'digest'

class User < ApplicationRecord
  has_many :posts
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Please enter a valid email" }

  validates :password_digest, presence: true

  before_validation :set_invalid_email_error



  def password=(password)
    self.password_digest = hash_password(password)
  end

  def authenticate(password)
    password_digest == hash_password(password)
  end

  private

  def hash_password(password)
    Digest::SHA256.hexdigest(password)
  end
  def set_invalid_email_error
    errors.add(:email, "Please enter a valid email") if email.present? && !URI::MailTo::EMAIL_REGEXP.match?(email)
  end
end