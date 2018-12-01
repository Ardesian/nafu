# == Schema Information
#
# Table name: applications
#
#  id          :bigint(8)        not null, primary key
#  user_id     :bigint(8)
#  fname       :string
#  mname       :string
#  lname       :string
#  email       :string
#  address1    :string
#  address2    :string
#  city        :string
#  state       :string
#  zip         :string
#  cell_phone  :string
#  home_phone  :string
#  citizen     :boolean
#  felony      :boolean
#  education   :text
#  references  :text
#  approved_at :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Application < ApplicationRecord
  belongs_to :user, optional: true # (Required after approved)

  def approved?; approved_at?; end
end
