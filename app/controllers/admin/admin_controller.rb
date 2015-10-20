class Admin::AdminController < ApplicationController
  before_filter :if_admin?

  def index
    @users = User.all
    @admin = User.new
  end

  def edit_multiple
  end

  def update_multiple
  end


end