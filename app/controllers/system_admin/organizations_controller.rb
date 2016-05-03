class SystemAdmin::OrganizationsController < SystemAdmin::AdminController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  def index
    @organizations = Organization.all
  end

  def show
  end

  def new
    @organization = Organization.new
  end


  def edit
  end

  def create
    @organization = Organization.new(organization_params)
      if @organization.save
         redirect_to system_admin_organizations_path, notice: 'Organization was successfully created.'
      else
         render :new
      end
  end

  def update
      if @organization.update(organization_params)
         redirect_to system_admin_organizations_path, notice: 'Organization was successfully updated.'
      else
       render :edit
      end
  end

  def destroy
    @organization.destroy
    redirect_to system_admin_organizations_path, notice: 'Organization was successfully destroyed.'
  end

  private
    def set_organization
      @organization = Organization.find(params[:id])
    end

    def organization_params
      params.require(:organization).permit(:name, :description, :domain, :owner_id)
    end
end
