# == Schema Information
#
# Table name: candidates
#
#  id                 :bigint(8)        not null, primary key
#  user_id            :bigint(8)
#  encrypted_password :string           default(""), not null
#  fname              :string
#  mname              :string
#  lname              :string
#  email              :string
#  address1           :string
#  address2           :string
#  city               :string
#  state              :string
#  zip                :string
#  cell_phone         :string
#  home_phone         :string
#  citizen            :boolean
#  felony             :boolean
#  education          :text
#  references         :text
#  approved_at        :datetime
#  denied_at          :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Candidate < ApplicationRecord
  belongs_to :user, optional: true # (Required after approved)

  scope :pending, -> { where(approved_at: nil, denied_at: nil) }

  def approved?; approved_at?; end

  def password; end
  def password=(new_password)
    self.encrypted_password = User.new(password: new_password).encrypted_password
  end

  def approve!
    user = User.create(
      encrypted_password: encrypted_password,
      email: email,
      phone: cell_phone,
      fname: fname,
      mname: mname,
      lname: lname,
    )

    return user unless user.persisted?
    update(approved_at: Time.current, user: user, denied_at: nil)
  end

  def deny!
    update(denied_at: Time.current, approved_at: nil)
  end
end
