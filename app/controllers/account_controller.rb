class AccountController < ApplicationController
  before_action { @title = "Account" }
  before_action :authenticate_user

  def show
    redirect_to shift_path(current_user.current_shift) if current_user.current_shift.present?
    @user = current_user
  end

  def edit
    # @user = current_user
  end

  def update
    # @user = current_user
    #
    # if @user.update(user_params)
    # else
    # end
  end

  private

  def user_params
    # params.require(:user).permit(
    #   :fname
    # )
  end

end
