# == Schema Information
#
# Table name: products
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  available  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ApplicationRecord
  has_many :trays
  has_many :assignments
  has_many :goals

  scope :available, -> { where(available: true) }
  scope :unavailable, -> { where(available: [false, nil]) }

  defaults available: true
end
