class ShiftsController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_team_lead, only: [:index]
  before_action :hide_footer, except: [:index]

  def new
    @title = "In Queue"
  end

  def create
  end

  def show
    @shift = current_user.shifts.find(params[:id])
    @title = "Task Details"

    @projects = Project.current.order(end_date: :desc)
    @products = Product.available.order(:name)
    @sizes = ProductSize.available.order(:name)
    @duties = Duty.available.order(:name)

    @assignment = current_user.assignments.order(:updated_at).last.try(:dup) || current_user.assignments.new

    render "assignments/new"
  end

  def complete
    current_user.current_shift.complete!

    redirect_to account_path
  end

  def index
    @title = "Shift Queue"
    @users = User.where(id: @login_queue.keys)
  end
end
