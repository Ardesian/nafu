class ::Admin::ProductSizesController < ::Admin::BaseController
  before_action :setup
  before_action { @title = "Product Sizes" }

  def index
    @product_sizes = ProductSize.order(name: :asc)
  end

  def new
    @product_size = ProductSize.new

    render :form
  end

  def edit
    render :form
  end

  def create
    @product_size = ProductSize.new(product_size_params)

    if @product_size.save
      redirect_to [:admin, :product_sizes]
    else
      render :form
    end
  end

  def update
    if @product_size.update(product_size_params)
      redirect_to [:admin, :product_sizes]
    else
      render :form
    end
  end

  private

  def setup
    @product_size = ProductSize.find(params[:id]) if params[:id].present?
  end

  def product_size_params
    params.require(:product_size).permit(
      :name,
      :available,
      :amount_per_tray
    )
  end
end
