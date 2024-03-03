# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :job_applications, dependent: :destroy

  validates :password, on: [:create, :password_change], presence: true, length: { minimum: 8 }
  validates :email,
    format: { with: URI::MailTo::EMAIL_REGEXP },
    uniqueness: { case_sensitive: false }

  normalizes :email, with: -> { _1.strip.downcase }
end
