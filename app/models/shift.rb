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
  include TimeHelper
  
  belongs_to :team_lead, class_name: "User", required: true
  belongs_to :user, required: true

  has_many :assignments
  has_many :pauses

  def current_pause
    pauses.find_by(ended_at: nil)
  end

  def current_task
    assignments.find_by(ended_at: nil)
  end

  def pause!(assignment_id=nil)
    current_pause || pauses.create(started_at: Time.current, user: user, assignment_id: assignment_id)
  end

  def resume!
    current_pause&.update(ended_at: Time.current)
  end

  def title
    created_at.strftime("%b %-d, %Y - %-I:%M %p")
  end

  def duration
    return 0 unless ended_at.present? && started_at.present?
    (ended_at.to_i - started_at.to_i) - pauses.sum(&:duration)
  end

  def duration_in_words
    super(duration)
  end

  def complete!
    update(ended_at: Time.current)
  end
end
