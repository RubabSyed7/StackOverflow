class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy, :edit]
  load_resource :question, find_by: :id
  load_resource :answer, find_by: :id
  load_resource :comment, through: :question
  before_action :set_commentable, only: :create

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to questions_path, notice: 'Comment was successfully posted.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to questions_path, notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
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
