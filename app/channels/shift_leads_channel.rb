class ShiftLeadsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "login_queue"
  end

  def approve(data)
    return unless current_user.team_lead?
    data.deep_symbolize_keys!
    user = User.find(data[:uid])
    shift = user.current_shift || user.shifts.create(started_at: Time.current, team_lead: current_user)
    shift_url = Rails.application.routes.url_helpers.current_shifts_path
    ShiftsChannel.broadcast_to(user, shift_url: shift_url)
  end
end
