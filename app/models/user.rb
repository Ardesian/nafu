# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  fname                  :string
#  mname                  :string
#  lname                  :string
#  phone                  :string
#  role                   :integer          default("trainee")
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
  devise :database_authenticatable, :registerable, :recoverable, :trackable, :validatable

  include Moddable

  has_one :candidate
  has_one_attached :avatar
  # user.avatar.attach(params[:avatar])
  # user.avatar.attached?
  # user.avatar.purge
  # user.avatar.purge_later
  # https://edgeguides.rubyonrails.org/active_storage_overview.html#transforming-images

  has_many :assignments
  has_many :shifts
  has_many :written_notes, class_name: "Note", inverse_of: :author
  has_notes

  def all_notes
    Note.where("author_id = :uid OR user_id = :uid", uid: id).order(created_at: :desc)
  end

  def phone; candidate.cell_phone; end

  def avatar_url
    avatar.attached? ? avatar : "default-avatar.png"
  end

  def full_name
    "#{fname} #{lname}"
  end

  def current_shift
    shifts.find_by(ended_at: nil)
  end

  def password_required?
    encrypted_password.blank?
  end
end
