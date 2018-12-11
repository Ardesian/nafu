class ::Admin::AssignmentsController < ::Admin::BaseController

  def index
    # Scope by shift/user/relevant?
    Assignment.order(started_at: :desc)
  end

  private

  def resource_params
    params.require(:assignment).permit(
      notes: [:author_id, :body]
    )
  end
end
