# == Schema Information
#
# Table name: pauses
#
#  id            :bigint(8)        not null, primary key
#  user_id       :bigint(8)
#  shift_id      :bigint(8)
#  assignment_id :bigint(8)
#  started_at    :datetime
#  ended_at      :datetime
#

class Pause < ApplicationRecord
  belongs_to :user
  belongs_to :shift
  belongs_to :assignment, optional: true

  scope :active, -> { where.not(started_at: nil).where(ended_at: nil) }
  scope :valid, -> { where.not(started_at: nil, ended_at: nil) }
end
