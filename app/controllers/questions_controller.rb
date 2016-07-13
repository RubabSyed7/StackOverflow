class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy, :edit]
  load_resource 
  authorize_resource only: [:edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.paginate(page: params[:page], per_page: 3)
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question.user = current_user
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
    end
  end

  private
  
  def question_params
     params.require(:question).permit(:title, :text)
  end
end
