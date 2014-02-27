class UserAnswer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  def correct?
    recorded_answer == question.answer
  end

end
