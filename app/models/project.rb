# == Schema Information
#
# Table name: projects
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :text
#  start_date  :date
#  end_date    :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Project < ApplicationRecord
  has_many :trays
  has_many :goals
  has_many :assignments

  scope :current, ->(now=Time.current) { where("projects.start_date < :now AND (projects.end_date > :now OR projects.end_date IS NULL)", now: now.to_date) }

  def progress_percentage
    return unless goal_bottles.positive?
    (current_bottles / goal_bottles.to_f) * 100
  end

  def timeline_percentage
    return unless goal_bottles.positive?
    return if end_date.blank? || start_date.blank?

    end_stamp = end_date.to_datetime.to_i
    start_stamp = start_date.to_datetime.to_i
    now = Time.current.to_i

    return 0 if start_stamp > now
    return 100 if end_stamp < now

    normalized_end = end_stamp - start_stamp
    normalized_progress = now - start_stamp

    (normalized_progress.to_f / normalized_end.to_f) * 100
  end

  def current_bottles
    goals.sum(:current_amount).to_i
  end

  def goal_bottles
    goals.sum(:desired_amount).to_i
  end
end
