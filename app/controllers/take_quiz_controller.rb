class TakeQuizController < ApplicationController
 
  def new
    login_required
    @current_user = current_user
    @quiz = Quiz.find(params[:id])
  end

  def create
    
  end

  def show
  end

end
