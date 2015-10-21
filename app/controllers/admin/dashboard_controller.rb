class Admin::DashboardController < Admin::AdminController

  def index
    @users = User.all
    @admin = User.new
  end

end