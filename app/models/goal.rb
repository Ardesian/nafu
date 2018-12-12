# == Schema Information
#
# Table name: goals
#
#  id              :bigint(8)        not null, primary key
#  project_id      :bigint(8)
#  product_id      :bigint(8)
#  product_size_id :bigint(8)
#  current_amount  :integer
#  desired_amount  :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Goal < ApplicationRecord
  belongs_to :project,      required: true
  belongs_to :product,      required: true
  belongs_to :product_size, required: true

  after_create :update_current_amount

  def product=(name)
    if name.is_a?(String)
      super(Product.find_by(name: name))
    else
      super(name)
    end
  end

  def progress_percentage
    return unless desired_amount.positive?
    (current_amount.to_i / desired_amount.to_f) * 100
  end

  def update_current_amount
    update(current_amount: project.assignments.where(product_id: product_id, product_size_id: product_size_id).sum(:filled))
  end
end
