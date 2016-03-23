class Admin::UsersController < Admin::AdminController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.new
    @users = User.all
  end

  def send_invite
    User.invite!(user_params) do |u|
      u.organizations_users.build(organization_id: params[:organization_id], role: OrganizationsUser.roles[params[:role]])
    end
    redirect_to admin_users_url
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
