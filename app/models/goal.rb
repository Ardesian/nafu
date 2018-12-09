# == Schema Information
#
# Table name: goals
#
#  id              :bigint(8)        not null, primary key
#  project_id      :bigint(8)
#  product_id      :bigint(8)
#  product_size_id :bigint(8)
#  amount          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Goal < ApplicationRecord
  belongs_to :project, required: true
  belongs_to :product, required: true

  def product=(name)
    if name.is_a?(String)
      super(Product.find_by(name: name))
    else
      super(name)
    end
  end
end
