class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :destroy, :add, :del]


#before_filter :find_project, only: [:show, :edit, :update, :destroy, :upvote]
#before_filter :if_admin, only: [:edit, :update, :destroy, :new, :create]

  # GET /projects
  def index
    @projects = Project.all
#@projects = @projects.where("price >= ?", params[:price_from]) if params[:price_from]
#@projects = @projects.where("created_at >= ?", 1.day.ago) if params[:today]
#@projects = @projects.where("votes_count >=?", params[:votes_from]) if params[:votes_from]
#@projects = @projects.order("votes_count DESC", "price")
#@projects = @projects.includes(:image)
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
        @project.users << current_user
        @project.users.inspect
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
  @ad_us = User.find_by_id(params[:id_k].values).name
 if   @project.users << User.find(params[:id_k].values)
     respond_to do |format|
      format.html { redirect_to @project, notice: "User #{@ad_us } was successfully added." }
    end
  else
    respond_to do |format|
      format.html { redirect_to @project, notice: "Error." }
    end
  end
end
def del
  @del_us = User.find(params[:id_u])
    if @project.users.delete(params[:id_u])
     respond_to do |format|
      format.html { redirect_to @project, notice: "User #{@del_us.name} was  deleted." }
    end
    else
    respond_to do |format|
      format.html { redirect_to @project, notice: "Error." }
    end
  end
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