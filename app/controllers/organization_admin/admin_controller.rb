class OrganizationAdmin::AdminController < ApplicationController
  before_action :organization_admin_only
end
