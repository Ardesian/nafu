# == Schema Information
#
# Table name: shifts
#
#  id           :bigint(8)        not null, primary key
#  team_lead_id :bigint(8)
#  user_id      :bigint(8)
#  started_at   :datetime
#  ended_at     :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Shift < ApplicationRecord
  belongs_to :team_lead, class_name: "User", required: true
  belongs_to :user, required: true
  has_many :assignments
end
