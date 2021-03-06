class User < ActiveRecord::Base
	validates :username,
            presence: true,
            uniqueness: true,
            length: { minimum: 3}

  has_secure_password 

	validates :password, 
						presence: { on: :create }, 
						length: { minimum: 5, allow_blank: true },
						allow_blank: true
  
  has_many :questions
  has_many :user_answers


  def score
    user_answers.select {|useranswer| useranswer.correct? }.count
  end


end
