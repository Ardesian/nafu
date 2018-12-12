class ::Admin::ShiftsController < ::Admin::BaseController
  before_action :setup
  before_action { @title = "History" }

  def index
    @shifts = Shift.order(started_at: :desc)
    @shifts = @shifts.where(user_id: params[:user_id]) if params[:user_id].present?
  end

  # def new
  #   @shift = Shift.new
  #
  #   render :form
  # end
  #
  # def edit
  #   render :form
  # end
  #
  # def create
  #   @shift = Shift.new(shift_params)
  #
  #   if @shift.save
  #     redirect_to [:admin, :shifts]
  #   else
  #     render :form
  #   end
  # end
  #
  # def update
  #   if @shift.update(shift_params)
  #     redirect_to [:admin, :shifts]
  #   else
  #     render :form
  #   end
  # end
  #
  private

  def setup
    @shift = Shift.find(params[:id]) if params[:id].present?
  end
  #
  # def shift_params
  #   params.require(:shift).permit(
  #     :name,
  #     :available
  #   )
  # end
end
