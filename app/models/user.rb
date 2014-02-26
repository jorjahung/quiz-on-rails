class User < ActiveRecord::Base
  validates :username,
            presence: true,
            uniqueness: true,
            length: { minimum: 3}
  has_secure_password 
  validates :password, presence: true, length:{minimum: 5}

end
