class CommentsController < ApplicationController
  before_action :set_project
  before_action :set_comment, only: [:show, :destroy]

  def index
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # POST /comments
  def create
    @comment = @project.comments.build(comment_params) # Comment.new(project_id: 2)
    @comment.owner = current_user
    if @comment.save
      redirect_to @project, notice: 'Comment was successfully created.'
    else
      flash[:alert] = '!!! ERROR  !!! ----->Not created fill the form <--------'
      redirect_to @project
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
     redirect_to @project
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_comment
      @comment = current_user.comments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:text)
    end


end
