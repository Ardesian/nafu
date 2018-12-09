# == Schema Information
#
# Table name: assignments
#
#  id              :bigint(8)        not null, primary key
#  user_id         :bigint(8)
#  project_id      :bigint(8)
#  shift_id        :bigint(8)
#  product_id      :bigint(8)
#  product_size_id :bigint(8)
#  tray_id         :bigint(8)
#  duty_id         :bigint(8)
#  filled          :integer
#  started_at      :datetime
#  ended_at        :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Assignment < ApplicationRecord
  belongs_to :user,    required: true
  belongs_to :project, required: true
  belongs_to :shift,   required: true
  belongs_to :product, required: true
  belongs_to :size,    required: true
  belongs_to :tray,    required: true
  belongs_to :duty,    required: true

  has_many :notes
end
