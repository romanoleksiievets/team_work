class OrganizationAdmin::UsersController < OrganizationAdmin::AdminController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @user = User.new
    @users = User.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to organization_admin_users_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to organization_admin_users_url, notice: 'User was successfully destroyed.'
  end

  def send_invite
    User.invite!(user_params) do |u|
      u.organizations_users.build(organization_id: params[:organization_id], role: OrganizationsUser.roles[params[:role]])
    end
    redirect_to organization_admin_users_url
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
