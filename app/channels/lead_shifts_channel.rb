class LeadShiftsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "login_queue"
  end

  def unsubscribed
    # Remove from global list
  end

  def approve_shift(data)
    return unless current_user.mod?
    # Create shift <data>, notify user's websocket
  end

  # Approving via queue page creates a shift then redirects user to that shift.
end
