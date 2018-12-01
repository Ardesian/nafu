# == Schema Information
#
# Table name: notes
#
#  id         :bigint(8)        not null, primary key
#  author_id  :bigint(8)
#  tray_id    :bigint(8)
#  task_id    :bigint(8)
#  user_id    :bigint(8)
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Note < ApplicationRecord
  belongs_to :author, required: true, class_name: "User"
  belongs_to :tray,   optional: true # - If any broke, tray is sticky, etc
  belongs_to :task,   optional: true # - Broke X bottles
  belongs_to :user,   optional: true # - Sucks at Filling
end
