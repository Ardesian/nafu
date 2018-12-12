class ::Admin::ProductsController < ::Admin::BaseController
  before_action :setup
  before_action { @title = "Products" }

  def index
    @title = "Products"
    @projects = Product.current.order(created_at: :desc)
  end

  def new
    @project = Product.new

    render :form
  end

  def edit
    render :form
  end

  def update
    if @project.update(project_params)
      redirect_to [:admin, @project]
    else
      render :form
    end
  end

  private

  def setup
    @project = Product.find(params[:id]) if params[:id].present?
  end

  def project_params
    params.require(:project).permit(
      :name,
      :description,
      :start_date,
      :end_date
    )
  end
end
