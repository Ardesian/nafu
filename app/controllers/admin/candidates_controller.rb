class ::Admin::CandidatesController < ::Admin::BaseController

  def index
    Candidate.pending.order(created_at: :desc)
  end

  def show
    @resource = @resource_type.find(params[:id])
  end

  def edit
    @resource = @resource_type.find(params[:id])
  end

  def update
    @resource = @resource_type.find(params[:id])

    if @resource.update(resource_params)
      redirect_to :admin, @resource
    else
      redirect_to :admin, :edit, @resource
    end
  end
end
