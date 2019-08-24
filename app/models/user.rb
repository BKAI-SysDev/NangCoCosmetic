class User < ApplicationRecord
  validates :name, presence: true, length: {maximum:30}
  validates :email, presence: true, length:{maximum:50}
  before_save{ self.email = email.downcase }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def User.digest(string)
    cost = ActiveModel :: SecurePassword.min.cost ? BCrypt::Engine::MIN_COST:
                                                    BCrypt::Engine.cost
    BCrypt::Pasword.create(string, cost: cost)
  end
end
