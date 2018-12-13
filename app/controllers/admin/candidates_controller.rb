class ::Admin::CandidatesController < ::Admin::BaseController
  before_action :setup

  def index
    @title = "Applications"
    @all_candidates = Candidate.order(created_at: :desc)
    @filter_applied = params[:denied] == "true" || params[:approved] == "true"

    @candidates = @all_candidates.pending unless @filter_applied
    @candidates = @all_candidates.approved if params[:approved] == "true"
    @candidates = @all_candidates.denied if params[:denied] == "true"
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
    @user = User.find(params[:user_id]) if params[:user_id].present?
  end
end
