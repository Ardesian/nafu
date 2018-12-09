class ShiftsController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_team_lead, only: [:index]

  def new
    @title = "In Queue"
    @hide_footer = true
  end

  def create
  end

  def show
    # Verify correct user is actually in shift
  end

  def index
    @title = "Shift Queue"
    @users = User.where(id: @login_queue.keys)
  end
end
