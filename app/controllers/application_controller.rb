class ApplicationController < ActionController::Base
  private

  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      account_path
    else
      stored_location_for(resource) || request.referer || account_path
    end
  end
end
