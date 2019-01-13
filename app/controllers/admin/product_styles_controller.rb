class ::Admin::ProductStylesController < ::Admin::BaseController
  before_action :setup
  before_action { @title = "Product Sizes" }

  def index
    @product_styles = ProductStyle.order(id: :asc)
  end

  def new
    @product_style = ProductStyle.new

    render_form
  end

  def edit
    render_form
  end

  def create
    @product_style = ProductStyle.new(product_style_params)

    if @product_style.save
      redirect_to [:admin, :product_styles]
    else
      render_form
    end
  end

  def update
    if @product_style.update(product_style_params)
      redirect_to [:admin, :product_styles]
    else
      render_form
    end
  end

  private

  def render_form
    @product_tasks = Duty.available.not_administrative.map do |duty|
      task_time = @product_style.product_task_times.find_by(duty_id: duty.id)

      {
        duty_id: duty.id,
        duty_name: duty.name,
        minutes_per_tray: task_time.try(:minutes_per_tray)
      }
    end

    render :form
  end

  def setup
    @product_style = ProductStyle.find(params[:id]) if params[:id].present?
  end

  def product_style_params
    params.require(:product_style).permit(
      :size,
      :color,
      :available,
      :amount_per_tray,
      duties: [
        :duty_id,
        :minutes_per_tray
      ]
    )
  end
end
