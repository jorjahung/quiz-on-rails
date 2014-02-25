class QuestionsController < ApplicationController

  def index
  	@answer = session[:answer]
    @questions = Question.all
  end

  def check
  	session[:answer] == params[:answer]
  	redirect_to questions_index_path
  end
end
