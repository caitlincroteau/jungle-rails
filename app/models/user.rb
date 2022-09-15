class User < ApplicationRecord
  has_secure_password
  
  validates :name, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 5 }

  def authenticate_with_credentials(email, password)

    @user = User.find_by_email(email)

    if @user.authenticate(password)
      @user
    else
      nil
    end

  end

end
