class User < ActiveRecord::Base
  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    if user && user.authenticate(password) 
      return user
    else 
      return nil
    end
  end
  
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  
  has_secure_password

  validates :password, length: { minimum: 6 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

end