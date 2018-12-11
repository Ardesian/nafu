class ::Admin::ProjectsController < ::Admin::BaseController

  def index
    Project.current.order(created_at: :desc)
  end

  private

  def resource_params
    params.require(:project).permit(
      notes: [:author_id, :body]
    )
  end
end
