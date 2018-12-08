module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags "ActionCable", current_user.try(:full_name) || "Guest"
    end

    protected

    def find_verified_user # this checks whether a user is authenticated with devise
      env['warden'].user
    end
  end
end
