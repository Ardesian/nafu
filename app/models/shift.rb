# == Schema Information
#
# Table name: shifts
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)
#  started_at :datetime
#  ended_at   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Shift < ApplicationRecord
  belongs_to :user, required: true
  has_many :tasks
end
