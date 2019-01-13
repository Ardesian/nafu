# == Schema Information
#
# Table name: duties
#
#  id             :bigint(8)        not null, primary key
#  name           :string
#  administrative :boolean
#  available      :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Duty < ApplicationRecord
  include Availability

  has_many :assignments
  has_many :product_task_times

  scope :administrative, ->  { where(administrative: true) }
  scope :not_administrative, ->  { where(administrative: [nil, false]) }
end
