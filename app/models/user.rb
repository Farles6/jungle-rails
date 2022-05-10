class User < ApplicationRecord
  has_secure_password

  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :uniqueness => true

  validates :email, :first_name, :last_name, presence: true 

  validates :password, :length => { :minimum => 8 }

  def self.authenticate_with_credentials(email, password)
    # email = email.downcase.strip
    @user = self.find_by_email(email)

    if @user && @user.authenticate(password)
      @user
    else
      nil
  end
end

end
