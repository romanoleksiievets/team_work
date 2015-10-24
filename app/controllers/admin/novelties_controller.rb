class  Admin::NoveltiesController < ApplicationController
  before_action :set_novelties, only: [:show, :edit, :update, :destroy]

  def index
    @novelties = Novelty.all
  end

  def show
    @novelty = Novelty.find(params[:id])
    @novelty_category_create = NoveltyCategory.new
    @novelty_categories = NoveltyCategory.all
  end

  def new
    @novelty = Novelty.new
  end


  def edit
  end

  def create
    @novelty = Novelty.new(novelty_params)
      if @novelty.save
         redirect_to admin_novelties_path, notice: 'novelty was successfully created.'
      else
         render :novelty
      end
  end

  respond_to :html, :json
  def update
      if @novelty.update(novelty_params)
        # redirect_to admin_novelties_path, notice: 'novelty was successfully updated.'
        respond_with @novelty
      else
      render :edit
    end
  end

  def destroy
    @novelty.destroy
    redirect_to admin_novelties_path, notice: 'novelty was successfully destroyed.'
  end

  private
    def set_novelties
      @novelty = Novelty.find(params[:id])
      @novelty_category = @novelty.novelty_category
    end

    def novelty_params
      params.require(:novelty).permit(:title, :body, :tag, :novelty_category_id)
    end
end
