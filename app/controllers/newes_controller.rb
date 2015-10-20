class NewesController < ApplicationController

  def index
    @news = Newe.all
  end

  def show
    @new = Newe.find(params[:id])
  end

end
