class  OrganizationAdmin::NoveltiesController < OrganizationAdmin::AdminController
  before_action :set_novelties, only: [:show, :edit, :update, :destroy]
  before_action :set_novelty_categories, only: [:index, :show, :new]

  def index
    @novelties = Novelty.all
  end

  def show
    @novelty = Novelty.find(params[:id])
    @array_of_id_name = NoveltyCategory.get_id_name
  end

  def new
    @novelty = Novelty.new
    @novelty_category_create = NoveltyCategory.new
    @array_of_name_id = NoveltyCategory.get_name_id
  end


  def edit
  end

  def create
    @novelty = Novelty.new(novelty_params)
      if @novelty.save
         redirect_to organization_admin_novelties_path, notice: 'novelty was successfully created.'
      else
         redirect_to new_organization_admin_novelty_path
         flash[:error] = ' ERROR fill the form'
      end
  end

  respond_to :html, :json
  def update
      if @novelty.update(novelty_params)
        respond_to do |format|
          format.json { render json: @novelty}
        end
      else
      render :edit
    end
  end

  def destroy
    @novelty.destroy
    redirect_to organization_admin_novelties_path, notice: 'novelty was successfully destroyed.'
  end

  private
    def set_novelty_categories
      @novelty_categories = NoveltyCategory.all
    end

    def set_novelties
      @novelty = Novelty.find(params[:id])
      @novelty_category = @novelty.novelty_category
    end

    def novelty_params
      params.require(:novelty).permit(:title, :body, :tag, :novelty_category_id)
    end
end
