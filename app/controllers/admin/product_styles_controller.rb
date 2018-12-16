class ::Admin::ProductStylesController < ::Admin::BaseController
  before_action :setup
  before_action { @title = "Product Sizes" }

  def index
    @product_styles = ProductStyle.order(id: :asc)
  end

  def new
    @product_style = ProductStyle.new

    render :form
  end

  def edit
    render :form
  end

  def create
    @product_style = ProductStyle.new(product_style_params)

    if @product_style.save
      redirect_to [:admin, :product_styles]
    else
      render :form
    end
  end

  def update
    if @product_style.update(product_style_params)
      redirect_to [:admin, :product_styles]
    else
      render :form
    end
  end

  private

  def setup
    @product_style = ProductStyle.find(params[:id]) if params[:id].present?
  end

  def product_style_params
    params.require(:product_style).permit(
      :name,
      :available,
      :amount_per_tray,
      :expected_time_in_minutes
    )
  end
end
