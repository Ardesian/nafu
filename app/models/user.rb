# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  fname                  :string
#  mname                  :string
#  lname                  :string
#  role                   :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  has_one :application
  has_many :tasks
  has_many :shifts
  has_many :written_notes, class_name: "Note", inverse_of: :author
  has_many :notes

  enum role: {
  }
end
