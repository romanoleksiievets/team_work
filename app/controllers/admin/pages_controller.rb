class  Admin::PagesController < Admin::AdminController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    @pages = Page.all
  end

  def show
  end

  def new
    @page = Page.new
  end


  def edit
  end

  def create
    @page = Page.new(page_params)
      if @page.save
         redirect_to admin_pages_path, notice: 'Page was successfully created.'
      else
         render :new
      end
  end

  def update
      if @page.update(page_params)
         redirect_to admin_pages_path, notice: 'Page was successfully updated.'
      else
       render :edit
      end
  end

  def destroy
    @page.destroy

    redirect_to admin_pages_path, notice: 'Page was successfully destroyed.'

  end

  private
    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:title, :body, :description, :if_show)
    end
end
