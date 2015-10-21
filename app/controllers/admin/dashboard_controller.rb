class Admin::DashboardController <

  def index
    @users = User.all
    @admin = User.new
  end

end