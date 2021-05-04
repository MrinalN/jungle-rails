class User < ActiveRecord::Base

  has_secure_password

  def self.authenticate_with_credentials(param_email, param_password)
    email_sans_whitespace = param_email.strip
    user = User.where(email: email_sans_whitespace).first
    if user
      user && user.authenticate(param_password) 
    else
      nil
    end
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, :case_sensitive => false
  validates :password, confirmation: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
end
