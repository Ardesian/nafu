class ::Admin::ProjectsController < ::Admin::BaseController
  before_action :setup
  before_action { @title = "Project" }

  def index
    @title = "Projects"
    @projects = Project.current.order(created_at: :desc)
  end

  def new
    @project = Project.new

    render :form
  end

  def edit
    render :form
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to [:admin, @project]
    else
      render :form
    end
  end

  def update
    if @project.update(project_params)
      redirect_to [:admin, @project]
    else
      render :form
    end
  end

  def destroy
    if @project.destroy
      redirect_to admin_products_path
    else
      render :form
    end
  end

  private

  def setup
    @project = Project.find(params[:id]) if params[:id].present?
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
