class User < ActiveRecord::Base
  validates :username,
            presence: true,
            uniqueness: true,
            length: { minimum: 3}
  # attr_accessible :username, :password, :password_confirmation
end
