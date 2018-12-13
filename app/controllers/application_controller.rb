class ApplicationController < ActionController::Base
  before_action :set_notifications

  def flash_message
    flash.now[params[:flash_type].to_sym] = params[:message].html_safe
    render partial: 'layouts/flashes'
  end

  private

  def hide_title
    @hide_title = true
  end

  def hide_footer
    @hide_footer = true
  end

  def set_notifications
    @login_queue = Rails.cache.fetch("login_queue") { {} } if current_user.try(:team_lead?)
  end

  def unauthenticate_user
    if current_user.present?
      redirect_to account_path
    end
  end

  def authenticate_user
    if user_signed_in? && !current_user.try(:trainee?)
      sign_out :user
      return redirect_to new_user_session_path, alert: "You do not have permission to visit this page."
    end

    unless current_user.present?
      session[:forwarding_url] = request.original_url if request.get?
      redirect_to new_user_session_path, alert: "Please sign in first."
    end
  end

  def authenticate_team_lead
    unless current_user.try(:team_lead?)
      session[:forwarding_url] = request.original_url if request.get?
      redirect_to new_user_session_path, alert: "You do not have permission to visit this page."
    end
  end

  def authenticate_admin
    unless current_user.try(:admin?)
      session[:forwarding_url] = request.original_url if request.get?
      redirect_to new_user_session_path, alert: "You do not have permission to visit this page."
    end
  end

  def after_sign_in_path_for(resource)
    flash.alert.clear if request.referrer.nil?
    account_path
  end
end
