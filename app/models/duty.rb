# == Schema Information
#
# Table name: duties
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Duty < ApplicationRecord
  has_many :tasks
end
