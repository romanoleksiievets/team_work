class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find_by_url(params[:url])
  end

end
