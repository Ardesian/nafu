class ShiftsController < ApplicationController
  before_action :authenticate_user
  before_action :hide_footer, except: [:index, :show]

  def show
    @shift = current_user.shifts.find(params[:id])
    @title = "Shift"
  end

  def index
    @title = "Shift History"
    @shifts = current_user.shifts.order(started_at: :desc)
  end

  def new
    @title = "In Queue"
  end

  def current
    @shift = current_user.current_shift
    @title = "Task Details"

    @projects = Project.current.order(end_date: :desc)
    @products = Product.available.order(:name)
    @sizes = ProductSize.available.order(:name)
    @duties = Duty.available.order(:name)

    @assignment = current_user.assignments.order(:updated_at).last.try(:dup) || current_user.assignments.new
    @assignment.assign_attributes(shift_id: @shift.id)

    render "assignments/new"
  end

  def complete
    current_user.current_shift.complete!

    redirect_to account_path
  end
end
