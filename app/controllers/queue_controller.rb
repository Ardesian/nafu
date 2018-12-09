class QueueController < ApplicationController
  before_action :authenticate_team_lead

  def show
    @title = "Shift Queue"
    @users = User.where(id: @login_queue.keys)
  end
end
