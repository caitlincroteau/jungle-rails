class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 5 }

  before_create :format_email

  def self.authenticate_with_credentials(email, password)

    @email = email.strip
    @email_lower = @email.downcase

    @user = User.find_by_email(@email_lower)

    if @user.authenticate(password)
      @user
    else
      nil
    end

  end

  private

  def format_email
    self.email = email.strip
    self.email = self.email.downcase
  end

end


