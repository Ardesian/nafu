class ::Admin::ProductSizesController < ::Admin::BaseController

  def index
    ProductSize.order(:available, created_at: :desc)
  end

  private

  def resource_params
    params.require(:product_size).permit(
      notes: [:author_id, :body]
    )
  end
end
