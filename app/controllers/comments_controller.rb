class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy, :edit]
  load_resource :question, find_by: :id
  load_resource :answer, find_by: :id
  load_resource :comment, through: :question
	before_action :set_commentable, only: :create

  # GET /questions
  # GET /questions.json
  def index
    @comments = Comment.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @comment = Comment.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @comment = Comment.new(comment_params)
    set_commentable
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to questions_path, notice: 'Comment was successfully posted.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to questions_path, notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to questions_path, notice: 'Question was successfully destroyed.' }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def set_commentable
    if @question
      @comment.commentable = @question
    else
      @comment.commentable = @answer
    end
  end

end
