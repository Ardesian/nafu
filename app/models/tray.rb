# == Schema Information
#
# Table name: trays
#
#  id               :bigint(8)        not null, primary key
#  project_id       :bigint(8)
#  product_id       :bigint(8)
#  product_style_id :bigint(8)
#  tray_number      :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Tray < ApplicationRecord
  belongs_to :project,      required: true
  belongs_to :product,      required: true
  belongs_to :product_style, required: true

  has_many :assignments
  has_notes

  validates :tray_number, presence: true
  # t.integer :tray_number # (special- unique per project/product)
end
