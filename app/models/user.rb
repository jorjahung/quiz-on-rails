class User < ActiveRecord::Base
  has_secure_password 
  validates :password, presence: { on: :create }, length: { minimum: 5, allow_blank: true }
  validates :username,
            presence: true,
            uniqueness: true,
            length: { minimum: 3}
end
