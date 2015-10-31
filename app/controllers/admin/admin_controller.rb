class Admin::AdminController < ApplicationController
  before_filter :if_admin?
end