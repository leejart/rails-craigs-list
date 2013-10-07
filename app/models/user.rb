class User < ActiveRecord::Base
  has_many :posts

  has_secure_password
  valid_email_regex = /\w+\.?\w*@[a-zA-Z_]+?\.[a-zA-Z]{2,3}/

  validates :email, presence: true, uniqueness: true, format: { with: valid_email_regex }
end
