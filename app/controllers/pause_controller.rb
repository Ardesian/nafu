class PauseController < ApplicationController
  before_action :authenticate_user

  def pause
    @title = "Paused"
    @user = current_user
    @shift = @user.current_shift
    @pause = @shift.pause!(params[:assignment_id])

    render :show
  end
end
