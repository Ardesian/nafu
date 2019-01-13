# == Schema Information
#
# Table name: product_task_times
#
#  id               :bigint(8)        not null, primary key
#  duty_id          :bigint(8)
#  product_style_id :bigint(8)
#  minutes_per_tray :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class ProductTaskTime < ApplicationRecord
  belongs_to :duty
  belongs_to :product_style
end
