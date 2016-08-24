class WorkDaysController < ApplicationController
  before_action :set_work_day, only: [:show, :edit, :update, :destroy]

  # GET /work_days
  # GET /work_days.json
  def index
    @work_days = WorkDay.all

  end

  # GET /work_days/1
  # GET /work_days/1.json
  def show
    @work_days=WorkDay.all
  end



  def new
    @monitoring = Monitoring.find(params[:monitoring])
    @work_day = WorkDay.current(current_user, @monitoring, request.ip, true)
    @monitoring.update(status: 'Activa')
    respond_to :js
  end


  # GET /work_days/1/edit
  def edit

  end

  # POST /work_days
  # POST /work_days.json
  def create
    @work_day = WorkDay.new(work_day_params)

    respond_to do |format|
      if @work_day.save
        format.html { redirect_to @work_day, notice: 'Work day was successfully created.' }
        format.json { render :show, status: :created, location: @work_day }
      else
        format.html { render :new }
        format.json { render json: @work_day.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /work_days/1
  # PATCH/PUT /work_days/1.json
  def update
   

    respond_to do |format|
      if @work_day.update(work_day_params)
        if(@work_day.end_signature.present?)
          @work_day.update(end_date: (Time.now.utc - 5.hours))
          hora_inicial = (@work_day.start_date).to_i
          hora_final = (Time.now.utc - 5.hours).to_i
          hora_total = hora_final - hora_inicial

          if @work_day.monitoring.hours.present?
            aux = @work_day.monitoring.hours
            total = hora_total + aux
            @work_day.monitoring.update(hours: total )
          else
            @work_day.monitoring.update(hours: hora_total )
          end

          
        else
         
        end  
        format.html { redirect_to :back }
        #format.json { render :show, status: :ok, location: @work_day }
      else
        format.html { render :edit }
        format.json { render json: @work_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_days/1
  # DELETE /work_days/1.json
  def destroy
    @work_day.destroy
    respond_to do |format|
      format.html { redirect_to work_days_url, notice: 'Work day was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def close_workday
    work_day = WorkDay.find_by(id: params[:id])
    work_day.update(end_date: (Time.now.utc - 5.hours))

    redirect_to root_url 
  end


  def new_ping
      work_day = WorkDay.find_by(id: params[:id])
      redirect_to root_url 
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_day
      @work_day = WorkDay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_day_params
      params.fetch(:work_day, {})
      params.require(:work_day).permit(:start_signature, :end_signature)  
    end
end
