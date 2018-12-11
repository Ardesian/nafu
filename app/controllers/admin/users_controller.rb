class ::Admin::UsersController < ::Admin::BaseController

  def index
    User.order(created_at: :desc)
  end

  private

  def resource_params
    params.require(:user).permit(
      notes: [:author_id, :body]
    )
  end
end
