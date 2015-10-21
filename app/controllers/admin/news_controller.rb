class  Admin::NewsController < ApplicationController
  before_action :set_new, only: [:show, :edit, :update, :destroy]
  before_filter :if_admin?

  def index
    @news = New.all
  end

  def show
  end

  def new
    @new = New.new
  end


  def edit
  end

  def create
    @new = New.new(new_params)
      if @new.save
         redirect_to admin_news_index_path, notice: 'new was successfully created.'
      else
         render :new
      end
  end

  def update
      if @new.update(new_params)
         redirect_to admin_news_index_path, notice: 'new was successfully updated.'
      else
       render :edit
      end
  end

  def destroy
    @new.destroy

    redirect_to admin_news_index_path, notice: 'new was successfully destroyed.'

  end

  private
    def set_new
      @new = New.find(params[:id])
    end

    def new_params
      params.require(:new).permit(:title, :body, :tag)
    end
end
