class SystemAdmin::AdminController < ApplicationController
  before_action :system_admin_only
end
