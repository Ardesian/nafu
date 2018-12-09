# == Schema Information
#
# Table name: product_sizes
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  available  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductSize < ApplicationRecord
  scope :available, -> { where(available: true) }
end
