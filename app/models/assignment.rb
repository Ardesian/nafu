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
  belongs_to :user,         required: true
  belongs_to :project,      required: true
  belongs_to :shift,        required: true
  belongs_to :product,      required: true
  belongs_to :product_size, required: true
  belongs_to :duty,         required: true
  belongs_to :tray,         required: true

  has_notes

  attr_accessor :temp_tray_number
  before_validation :find_or_create_tray

  def tray_number; tray.try(:tray_number); end
  def tray_number=(new_tray_number)
    return if tray_id.present?
    return @temp_tray_number = tray_number unless project_id.present? && product_id.present? && product_size_id.present?

    self.tray = Tray.find_or_create_by(project: project, product: product, product_size: product_size, tray_number: new_tray_number)
  end

  private

  def find_or_create_tray
    tray_number = @temp_tray_number if tray_id.blank?
    # update(tray_number: @temp_tray_number)
  end
end
