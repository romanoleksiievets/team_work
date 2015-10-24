class Admin::NoveltyCategoriesController < ApplicationController
  before_action :set_novelty_category, only: [:destroy, :update]

  def create
    @novelty = Novelty.find(params[:novelty_id])
    @novelty_category= NoveltyCategory.new(novelty_category_params)
      if @novelty_category.save
         @novelty.novelty_category = @novelty_category
         @novelty.save
         redirect_to admin_novelty_path(@novelty), notice: 'Noveltys_category was successfully created.'
      else
      flash[:alert] = 'Error fill the form'
      redirect_to admin_novelty_path(@novelty)
      end
  end

respond_to :html, :json
  def update
      if @novelty_category.update(novelty_category_params)
         respond_with @novelty_category
      #   redirect_to admin_novelty_path, notice: 'Novelty was successfully updated.'
      else
       render :edit
      end
  end

  def destroy
    @novelty_category.destroy
    @novelty = Novelty.find(params[:novelty_id])
    redirect_to admin_novelty_path(@novelty)
  end

  private
    def set_novelty_category
      @novelty_category = NoveltyCategory.find(params[:id])
    end

    def novelty_category_params
      params.require(:novelty_category).permit( :name, :color)
    end
end
