class NoveltiesController < ApplicationController

  def index
    @novelties = Novelty.all
  end

  def show
    @novelty = Novelty.find(params[:id])
    @novelty_category = @novelty.novelty_category
    @novelty_categories = NoveltyCategory.all
  end

end
