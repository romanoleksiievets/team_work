class Admin::AdminController < ApplicationController
  def index
    @users = User.all
    @admin = User.new
  end

  def edit_multiple
  end

  def update_multiple
  end
end