# == Schema Information
#
# Table name: product_styles
#
#  id              :bigint(8)        not null, primary key
#  color           :string
#  size            :string
#  available       :boolean
#  amount_per_tray :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ProductStyle < ApplicationRecord
  include Availability

  has_many :trays
  has_many :assignments
  has_many :goals
  has_many :product_task_times
  has_many :duties, through: :product_task_times

  def name
    [size, color].map(&:presence).compact.join(" ")
  end

  def duties=(duty_args_list)
    duty_args_list.each do |duty_args|
      task_time = product_task_times.find_or_create_by(duty_args.slice(:duty_id))
      task_time.update(duty_args)
    end
  end
end
