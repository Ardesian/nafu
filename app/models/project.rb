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
    (current_bottles.to_i / goal_bottles.to_f) * 100
  end

  def current_bottles
    goals.sum(:current_amount)
  end

  def goal_bottles
    goals.sum(:desired_amount)
  end
end
