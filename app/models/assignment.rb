# == Schema Information
#
# Table name: assignments
#
#  id              :bigint(8)        not null, primary key
#  user_id         :bigint(8)
#  project_id      :bigint(8)
#  shift_id        :bigint(8)
#  product_id      :bigint(8)
#  product_size_id :bigint(8)
#  tray_id         :bigint(8)
#  duty_id         :bigint(8)
#  filled          :integer
#  started_at      :datetime
#  ended_at        :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Assignment < ApplicationRecord
  include TimeHelper

  belongs_to :user,         required: true
  belongs_to :project,      required: true
  belongs_to :shift,        required: true
  belongs_to :product,      required: true
  belongs_to :product_size, required: true
  belongs_to :duty,         required: true
  belongs_to :tray,         required: true

  has_many :pauses

  has_notes

  attr_accessor :temp_tray_number
  before_validation :find_or_create_tray
  after_commit :update_goals

  def tray_number; persisted? ? tray.try(:tray_number) : tray.try(:tray_number)&.try(:+, 1); end
  def tray_number=(new_tray_number)
    return if tray_id.present?
    return @temp_tray_number = new_tray_number unless project_id.present? && product_id.present? && product_size_id.present?

    self.tray = Tray.find_or_create_by(project: project, product: product, product_size: product_size, tray_number: new_tray_number)
  end

  def duration
    return 0 unless ended_at.present? && started_at.present?
    (ended_at.to_i - started_at.to_i) - pauses.sum(&:duration)
  end

  def duration_in_words
    super(duration)
  end

  private

  def update_goals
    project.goals.where(product_id: product_id, product_size_id: product_size_id).find_each(&:update_current_amount)
  end

  def find_or_create_tray
    tray_number = @temp_tray_number if tray_id.blank?
  end
end
