class ::Admin::CandidatesController < ::Admin::BaseController

  def index
    Candidate.pending.order(created_at: :desc)
  end

  private

  def resource_params
    params.require(:candidate).permit(
      notes: [:author_id, :body]
    )
  end
end
