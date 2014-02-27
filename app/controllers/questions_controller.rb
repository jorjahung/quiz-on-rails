class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def check
  	 question = Question.find(params[:id])
     user_answer = to_bool(params[:answer])

     @stored_answer = UserAnswer.create(question: question, user: current_user, recorded_answer: user_answer)
  	 
    if question.answer == @stored_answer.recorded_answer
  		flash[:notice] = "You answered #{@stored_answer.recorded_answer}. This is: Correct!!!!!"
  	else
  		flash[:notice] = "You answered #{@stored_answer.recorded_answer}. This is: WRONG! :("
  	end
  	redirect_to questions_path
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      redirect_to questions_path, notice: "Question saved!"
    else
      flash[:errors] = @question.error.full_messages
      redirect_to new_question_path
    end
  end

  private

  def question_params
    params.require(:question).permit(:body, :answer, :user)
  end


  def to_bool(answer)
    return true   if answer == "true"   
    return false  if answer == "false"  
  end

end

