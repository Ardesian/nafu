class ShiftLeadsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "login_queue"
  end

  def unsubscribed
    # Remove from global list
  end

  def approve(data)
    return unless current_user.team_lead?
    data.deep_symbolize_keys!
    shift = User.find(data[:uid]).shifts.create(started_at: Time.current, team_lead: current_user)
    shift_url = Rails.application.routes.url_helpers.shift_path(shift)
    ShiftsChannel.broadcast_to(shift.user, shift_url: shift_url)
  end

  # Approving via queue page creates a shift then redirects user to that shift.
end
