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
  include Availability

  has_many :trays
  has_many :assignments
  has_many :goals
end
