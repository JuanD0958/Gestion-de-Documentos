class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!, :verify_active!, :verify_status_rejected!, :verify_status!, :verify_monitor_active?

  helper_method :admin?, :monitor?, :shit?


  def admin?
  	user_signed_in? and current_user.admin?
  end


  def monitor?
  	user_signed_in? and current_user.monitor?
  end
  
  def verify_active!
  	sign_out_and_redirect(current_user) if user_signed_in? and current_user.inactive? 
  end

  def verify_status!
      sign_out_and_redirect(current_user) if user_signed_in? and current_user.dissaprove_monitor?
  end

  def verify_status_rejected!
      sign_out_and_redirect(current_user) if user_signed_in? and current_user.rejected?
  end

  def verify_monitor_active?
      if user_signed_in? and current_user.inactive?
        @mensaje_alerta=true
      end
  end


end
