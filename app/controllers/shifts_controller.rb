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
    @title = ""

    @projects = Project.current.order(end_date: :desc)
    @products = Product.available.order(:name)
    @sizes = ProductSize.available.order(:name)
    @duties = Duty.available.order(:name)
  end

  def index
    @title = "Shift Queue"
    @users = User.where(id: @login_queue.keys)
  end
end
