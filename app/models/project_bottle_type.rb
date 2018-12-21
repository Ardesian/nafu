# == Schema Information
#
# Table name: project_bottle_types
#
#  id               :bigint(8)        not null, primary key
#  project_id       :bigint(8)
#  duty_id          :bigint(8)
#  product_style_id :bigint(8)
#  minutes_per_tray :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class ProjectBottleType < ApplicationRecord
  belongs_to :project
  belongs_to :duty
  belongs_to :product_style
end
