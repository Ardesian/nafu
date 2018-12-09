class AssignmentsController < ApplicationController
  before_action :authenticate_user

  def show
    @assignment = current_user.assignments.find(params[:id])
  end

  def create
    @assignment = current_user.assignments.create(assignment_params.merge(started_at: Time.current))

    if @assignment.persisted?
      redirect_to edit_assignment_path(@assignment)
    else
      set_assignment_fields
      render :new
    end
  end

  def edit
    @title = "Task Details"
    @assignment = current_user.assignments.find(params[:id])
  end

  def update
    @assignment = current_user.assignments.find(params[:id])

    if @assignment.update(assignment_params.merge(ended_at: Time.current))
      redirect_to current_shifts_path
    else
      @title = "Task Details"
      render :edit
    end
  end

  private

  def set_assignment_fields
    @title = "Task Details"

    @projects = Project.current.order(end_date: :desc)
    @products = Product.available.order(:name)
    @sizes = ProductSize.available.order(:name)
    @duties = Duty.available.order(:name)
  end

  def assignment_params
    params.require(:assignment).permit(
      :shift_id,
      :project_id,
      :product_id,
      :product_size_id,
      :duty_id,
      :tray_number,
      :filled,
      notes: [:author_id, :body]
    )
  end
end
