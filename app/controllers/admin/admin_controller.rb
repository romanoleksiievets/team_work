class Admin::AdminController < ApplicationController
  before_action :admin_only
end
