class ApplicationController < ActionController::Base

  def flash_message
    flash.now[params[:flash_type].to_sym] = params[:message].html_safe
    render partial: 'layouts/flashes'
  end

  private

  def unauthenticate_user
    if current_user.present?
      redirect_to account_path
    end
  end

  def authenticate_user
    unless current_user.present?
      session[:forwarding_url] = request.original_url if request.get?
      redirect_to new_user_session_path, notice: "Please sign in first."
    end
  end

  def authenticate_admin
    unless current_user.try(:admin?)
      session[:forwarding_url] = request.original_url if request.get?
      redirect_to new_user_session_path, notice: "You do not have permission to visit this page."
    end
  end

  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      account_path
    else
      stored_location_for(resource) || request.referer || account_path
    end
  end
end
