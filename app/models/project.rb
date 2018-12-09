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

  def current_progress

  end
end
