class User < ActiveRecord::Base

  has_secure_password

  def authenticate_with_credentials
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, :case_sensitive => false
  validates :password, confirmation: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
end
