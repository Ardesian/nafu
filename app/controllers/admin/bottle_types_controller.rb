class ::Admin::BottleTypesController < ::Admin::BaseController
  before_action :setup
  before_action { @title = "Bottle Types" }

  def show
    @products = Product.available
    @bottle_types = ProjectBottleType.order(name: :asc)
  end

  def new
    @bottle_type = ProjectBottleType.new

    render :form
  end

  def edit
    render :form
  end

  def create
    @bottle_type = ProjectBottleType.new(product_params)

    if @bottle_type.save
      redirect_to [:admin, :products]
    else
      render :form
    end
  end

  def update
    if @bottle_type.update(product_params)
      redirect_to [:admin, :products]
    else
      render :form
    end
  end

  private

  def setup
    @project = Project.find(params[:project_id]) if params[:project_id].present?
    @bottle_type = ProjectBottleType.find(params[:id]) if params[:id].present?
  end

  def product_params
    params.require(:product).permit(
      :name,
      :available
    )
  end
end
