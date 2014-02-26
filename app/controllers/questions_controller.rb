class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def check
  	 question = Question.find(params[:id])

  	if question.answer == to_bool(params[:answer])
  		flash[:notice] = "Correct!!!!!"
  	else
  		flash[:notice] = "WRONG! :("
  	end
  	redirect_to questions_path
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Question saved!"
      redirect_to questions_path
    else
      flash[:notice] = "ERROR!"
    end
  end

  private

  def question_params
    params.require(:question).permit(:body, :answer)
  end

  def to_bool(answer)
    return true   if answer == "true"   
    return false  if answer == "false"  
  end

end

