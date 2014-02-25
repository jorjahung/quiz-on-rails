class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def check
  	 question = Question.find(params[:id])

  	if question.answer == to_bool(params[:answer])
  		flash[:notice] = "Correct!!"
  	else
  		flash[:notice] = "WRONG! :("
  	end
  	redirect_to questions_index_path
  end

  private

  def to_bool(answer)
    return true   if answer == "true"   
    return false  if answer == "false"  
  end

end

