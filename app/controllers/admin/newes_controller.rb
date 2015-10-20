class  Admin::NewesController < ApplicationController
  before_action :set_new, only: [:show, :edit, :update, :destroy]
  before_filter :if_admin?

  def index
    @news = Newe.all
  end

  def show
  end

  def new
    @new = Newe.new
  end


  def edit
  end

  def create
    @new = Newe.new(new_params)
      if @new.save
         redirect_to admin_newes_path, notice: 'new was successfully created.'
      else
         render :new
      end
  end

  def update
      if @new.update(new_params)
         redirect_to admin_newes_path, notice: 'new was successfully updated.'
      else
       render :edit
      end
  end

  def destroy
    @new.destroy

    redirect_to admin_newes_path, notice: 'new was successfully destroyed.'

  end

  private
    def set_new
      @new = Newe.find(params[:id])
    end

    def new_params
      params.require(:newe).permit(:title, :body, :tag)
    end
end
