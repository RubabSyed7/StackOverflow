class AnswersController < ApplicationController
  before_action :authenticate_user!, :set_answer
  
  def create
    @answer.user_id = current_user.id
    @answer.question_id = params[:question_id]

    respond_to do |format|
      if @answer.save
        format.html { redirect_to questions_path }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_answer
    @answer = Answer.new(answer_params)
  end

  def answer_params
    params.require(:answer).permit(:text, :question_id)
  end
end
