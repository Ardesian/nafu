class ApplicationController < ActionController::Base

  def flash_message
    flash.now[params[:flash_type].to_sym] = params[:message].html_safe
    render partial: 'layouts/flashes'
  end

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
