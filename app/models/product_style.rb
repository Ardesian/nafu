# == Schema Information
#
# Table name: product_styles
#
#  id                       :bigint(8)        not null, primary key
#  oil                      :string
#  color                    :string
#  size                     :string
#  available                :boolean
#  amount_per_tray          :integer
#  expected_time_in_minutes :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class ProductStyle < ApplicationRecord
  has_many :trays
  has_many :assignments
  has_many :goals

  scope :available, -> { where(available: true) }
  scope :unavailable, -> { where(available: [false, nil]) }

  defaults available: true

  def name
    [size, color, oil].map(&:presence).compact.join(" ")
  end
end
