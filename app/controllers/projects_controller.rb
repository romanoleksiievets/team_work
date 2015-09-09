class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :destroy, :add, :del]

  # GET /projects
  def index
    @projects = Project.all
  end

  # GET /projects/1
  def show
    @project = Project.find(params[:id])
    @comments = @project.comments
    @comment = Comment.new
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit

  end

  # POST /projects
  def create
    @project = current_user.my_projects.build(project_params)
       respond_to do |format|
      if @project.save
        format.html { redirect_to projects_url, notice: 'Project was successfully created.' }
      else
        format.html { render :new }
      end
  end
  end

  # PATCH/PUT /projects/1
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_url, notice: 'Project was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
    end
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
