# == Schema Information
#
# Table name: duties
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  available  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Duty < ApplicationRecord
  has_many :assignments

  scope :available, -> { where(available: true) }
  scope :unavailable, -> { where(available: [nil, false]) }

  defaults available: true
end
