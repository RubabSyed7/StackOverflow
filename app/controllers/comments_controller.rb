class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /comments/new
  def new
  end

  # GET /comments/1/edit
  def edit
  	# saving questions/question_id show page reference
  	session[:return_to] = request.referer 
  end

  # POST /comments
  def create
  	set_commentable
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_back fallback_location: root_path, notice: 'Comment was successfully posted' }
      else
        format.html { redirect_back fallback_location: root_path, notice: 'Comment failed to get posted' }
      end
    end
  end

  # PATCH /comments/1
  def update
    respond_to do |format|
      if @comment.update(comment_params)
      	format.html { redirect_to session[:return_to], notice: 'Comment was successfully updated' }
      else
        format.html { redirect_back fallback_location: root_path, notice: 'Comment failed to get updated' }
      end
    end
  end

  # DELETE /comments/1
  def destroy
    respond_to do |format|
      if @comment.destroy
        format.html { redirect_back fallback_location: root_path, notice: 'Comment was successfully destroyed' }
      else
      	format.html { redirect_back fallback_location: root_path, notice: 'Comment was not destroyed' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :commentable_id, :commentable_type)
  end

  def set_commentable
  	@comment.commentable_type = params[:comment][:commentable_type]
  	@comment.commentable_id = params[:comment][:commentable_id]
  end
end
