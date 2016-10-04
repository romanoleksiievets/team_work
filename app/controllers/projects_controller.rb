class ProjectsController < ApplicationController
  before_action :organization_admin_only, except: [:index, :show]
  before_action :organization_member_only, only: [:index, :show]
  before_action :set_project, only: [:edit, :update, :destroy, :add, :del]
  load_and_authorize_resource

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @comments = @project.comments
    @comment = Comment.new
    @attachment = Attachment.new
    @attachments = @project.attachments
    @array_of_users =  User.free_users(@project)
  end

  def new
    @project = Project.new
  end

  def edit

  end

  def create
    @project = current_user.my_projects.build(project_params)
      if @project.save
        redirect_to projects_url, notice: 'Project was successfully created.'
      else
        render :new
      end
  end

  def update
      if @project.update(project_params)
         redirect_to projects_url, notice: 'Project was successfully updated.'
      else
         render :edit
      end
  end

  def destroy
    @project.destroy
      redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

def add
  user = User.find_by_id(params[:id_k][:id])
  @project.users << user
  redirect_to @project, notice: "User #{user.name} was successfully added."
end

def del
  user = User.find(params[:id_u])
  @project.users.delete(user)
  redirect_to @project, notice: "User #{user.name} was  deleted."
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = current_user.my_projects.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :text, :city, :user_id)

    end
end
