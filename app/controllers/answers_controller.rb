class AnswersController < ApplicationController
  before_action :authenticate_user!
  load_resource :question
  load_resource :answer, through: :question
  authorize_resource 

  # POST /questions/id/answers
  def create
    @answer.user = current_user
    @answer.question = @question

    respond_to do |format|
      if @answer.save
        format.html { redirect_to questions_path }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /questions/id/answers/1
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to questions_path, notice: 'Answer was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /questions/id/answer/id
  # DELETE /questions/id/answer/id.json
  def destroy
    respond_to do |format|
      if @answer.destroy
        format.html { redirect_to questions_path, notice: 'Answer was successfully destroyed.' }
      else
        format.html { redirect_to questions_path, notice: 'Answer was not destroyed.' }
      end
    end
  end

  # GET /questions/id/answer/id/accept 
  def accept
    respond_to do |format|
      if @question.update(answers_id: params[:id])
        format.html { redirect_to questions_path, notice: "Answer successfully accepted" }
      else
        format.html { redirect_to questions_path, notice: "Answer not accepted"}
      end
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:text)
  end
end
