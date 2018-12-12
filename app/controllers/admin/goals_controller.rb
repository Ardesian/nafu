class ::Admin::GoalsController < ::Admin::BaseController
  before_action :setup
  before_action :form_details, only: [:new, :edit]
  before_action { @title = "Goal" }

  def new
    @goal = @project.goals.new

    render :form
  end

  def edit
    render :form
  end

  def create
    @goal = @project.goals.new(goal_params)

    if @goal.save
      redirect_to [:admin, @project]
    else
      form_details
      render :form
    end
  end

  def update
    if @goal.update(goal_params)
      redirect_to [:admin, @project]
    else
      form_details
      render :form
    end
  end

  def destroy
    if @goal.destroy
      redirect_to [:admin, @project]
    else
      form_details
      render :form
    end
  end

  private

  def form_details
    @products = Product.available.order(:name)
    @sizes = ProductSize.available.order(:name)
  end

  def setup
    @project = Project.find(params[:project_id])
    @goal = Goal.find(params[:id]) if params[:id].present?
  end

  def goal_params
    params.require(:goal).permit(
      :product_id,
      :product_size_id,
      :desired_amount
    )
  end
end
