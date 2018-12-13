class ::Admin::CandidatesController < ::Admin::BaseController
  before_action :setup

  def index
    @title = "Applications"
    @candidates = Candidate.pending.order(created_at: :desc)
  end

  def update
    if params[:approve] == "true"
      @candidate.approve!
    elsif params[:deny] == "true"
      @candidate.deny!
    end

    redirect_to [:admin, :candidates]
  end

  private

  def setup
    @title = "Application"
    @candidate = Candidate.find(params[:id]) if params[:id].present?
  end
end
