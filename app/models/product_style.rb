# == Schema Information
#
# Table name: product_styles
#
#  id              :bigint(8)        not null, primary key
#  color           :string
#  size            :string
#  available       :boolean
#  amount_per_tray :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ProductStyle < ApplicationRecord
  include Availability

  has_many :trays
  has_many :assignments
  has_many :goals

  def name
    [size, color].map(&:presence).compact.join(" ")
  end
end
