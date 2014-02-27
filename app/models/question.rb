class Question < ActiveRecord::Base
  validates_presence_of :body
  belongs_to :user

  def self.randomize
    self.order("RANDOM()").first
  end
end
