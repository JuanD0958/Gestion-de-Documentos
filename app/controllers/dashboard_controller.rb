class DashboardController < ApplicationController
  def index

  	if admin?
  		@solitudes = User.monitors.inactive
  		@monitors = User.monitors.active
  		@rejected = User.monitors.rejected
      @wordays_activos = WorkDay.open
      @dissaprove_monitors = User.monitors.dissaprove_monitor

      @pings = Ping.all_pins(params[:work_day_id])
      @monitorings = current_user.monitorings
      @registers_month = WorkDay.register_monitoring_month(params[:monitoring_id])  
      @assistances = Assistence.assistances(params[:workday_id])
  	else
      @monitors = User.monitors.active
  		@monitorings = current_user.monitorings
      @registers = WorkDay.register_monitoring(params[:monitoring_id])
  		@registers_month = WorkDay.register_monitoring_month(params[:monitoring_id])   
      
  	end

  end
  
  def hour_register
      @monitorings = current_user.monitorings
      @registers = WorkDay.register_monitoring(params[:monitoring_id])
      @registers_month = WorkDay.register_monitoring_month(params[:monitoring_id])
      @assistances = Assistence.assistances(params[:workday_id])
      respond_to :js
  end

  def hour_register2
      @monitoring_by_id = Monitoring.monitoring_by_id(params[:user_id])
      @monitors = User.monitors.active
      @register_by_user = WorkDay.register_by_user(params[:user_id])      
      respond_to :js
  end

  def registers_for_admin
       @monitors = User.monitors.active
      @monitorings = current_user.monitorings
      @registers = WorkDay.register_monitoring(params[:monitoring_id])
      @registers_month = WorkDay.register_monitoring_month(params[:monitoring_id])
      @assistances = Assistence.assistances(params[:workday_id])
      respond_to :js
  end

  def pings_monitors
     @pings = Ping.all_pins(params[:work_day_id]) ####
     @wordays_activos = WorkDay.open
     @monitorings = current_user.monitorings
     @registers = WorkDay.register_monitoring(params[:monitoring_id])
     @registers_month = WorkDay.register_monitoring_month(params[:monitoring_id])
     respond_to :js
  end
  def students_assitences
      @assistances = Assistence.assistances(params[:workday_id])
      @pings = Ping.all_pins(params[:work_day_id])
      
  end

  def signatures
    #@img = :imagen
    @workday = WorkDay.by_id(:id)
  end

end