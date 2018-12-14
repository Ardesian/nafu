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
  include TimeHelper
  
  belongs_to :user
  belongs_to :shift
  belongs_to :assignment, optional: true

  scope :active, -> { where.not(started_at: nil).where(ended_at: nil) }
  scope :valid, -> { where.not(started_at: nil, ended_at: nil) }

  def duration
    return 0 unless ended_at.present? && started_at.present?
    ended_at.to_i - started_at.to_i
  end

  def duration_in_words
    super(duration)
  end
end
