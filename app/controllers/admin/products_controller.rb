class ::Admin::ProductsController < ::Admin::BaseController

  def index
    Product.order(:available, created_at: :desc)
  end

  private

  def resource_params
    params.require(:product).permit(
      notes: [:author_id, :body]
    )
  end
end
