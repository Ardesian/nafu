class ::Admin::ProductsController < ::Admin::BaseController
  before_action :setup
  before_action { @title = "Products" }

  def index
    @title = "Products"
    @products = Product.order(name: :asc)
  end

  def new
    @product = Product.new

    render :form
  end

  def edit
    render :form
  end

  def update
    if @product.update(product_params)
      redirect_to [:admin, :products]
    else
      render :form
    end
  end

  private

  def setup
    @product = Product.find(params[:id]) if params[:id].present?
  end

  def product_params
    params.require(:product).permit(
      :name,
      :available
    )
  end
end
