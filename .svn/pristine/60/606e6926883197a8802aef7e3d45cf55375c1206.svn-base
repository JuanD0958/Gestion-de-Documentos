class AdminController < ApplicationController
  
  def approve_user
  	@user = User.find(params[:id])
  	@user.approve
    @monitors = User.monitors.active
    respond_to :js
  end

  def disapprove_user
  	@user = User.find(params[:id])
  	@user.disapprove
    @solitudes = User.monitors.inactive
  end

  def delete_solitude
  	@user = User.find(params[:id])
  	@user.reject
    @rejected = User.monitors.rejected
  end

  def dissaprove_monitors
    @user = User.find(params[:id])
    @user. dissaprove_monitor
    @dissaprove_monitors = User.monitors.dissaprove_monitor
  end
  
end