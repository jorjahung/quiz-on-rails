class Question < ActiveRecord::Base
  validates_presence_of :body
  belongs_to :user
  has_many :user_answers
  
  def self.randomize
    self.order("RANDOM()").first
  end
end
