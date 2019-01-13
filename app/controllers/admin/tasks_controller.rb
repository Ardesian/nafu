class ::Admin::TasksController < ::Admin::BaseController
  before_action :setup
  before_action { @title = "Tasks" }

  def index
    @tasks = Duty.order(:available, :name)
  end

  def new
    @task = Duty.new

    render :form
  end

  def edit
    render :form
  end

  def create
    @task = Duty.new(user_params)

    if @task.save
      redirect_to [:admin, :duties]
    else
      render :form
    end
  end

  def update
    if @task.update(user_params)
      redirect_to [:admin, :duties]
    else
      render :form
    end
  end

  private

  def setup
    @task = Duty.find(params[:id]) if params[:id].present?
  end

  def user_params
    params.require(:duty).permit(
      :name,
      :administrative,
      :available
    )
  end
end
