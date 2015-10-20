class Admin::DashboardController < ApplicationController
  before_filter :if_admin?
end