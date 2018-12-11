class ::Admin::ShiftsController < ::Admin::BaseController

  def index
    Shift.order(started_at: :desc)
  end

  private

  def resource_params
    params.require(:shift).permit(
      notes: [:author_id, :body]
    )
  end
end
