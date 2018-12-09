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
  end

  def index
    @title = "Shift Queue"
    @users = User.where(id: @login_queue.keys)
  end
end
