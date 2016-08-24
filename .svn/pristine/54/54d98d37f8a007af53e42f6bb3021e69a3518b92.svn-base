class AssistencesController < ApplicationController
  before_action :set_assistence, only: [:show, :edit, :update, :destroy]

  # GET /assistences
  # GET /assistences.json
  def index
    @assistences = Assistence.all
  end

  # GET /assistences/1
  # GET /assistences/1.json
  def show
  end

  # GET /assistences/new
  def new
    @monitoring = Monitoring.find(params[:id])
  end

  # GET /assistences/1/edit
  def edit
  end

  # POST /assistences
  # POST /assistences.json
  def create
    @assistence = Assistence.create(assistence_params)
    
    redirect_to @assistence.work_day.monitoring
  end

  # PATCH/PUT /assistences/1
  # PATCH/PUT /assistences/1.json
  def update
    respond_to do |format|
      if @assistence.update(assistence_params)
        format.html { redirect_to @assistence, notice: 'Assistence was successfully updated.' }
        format.json { render :show, status: :ok, location: @assistence }
      else
        format.html { render :edit }
        format.json { render json: @assistence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assistences/1
  # DELETE /assistences/1.json
  def destroy
    @assistence.destroy
    respond_to do |format|
      format.html { redirect_to assistences_url, notice: 'Assistence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assistence
      @assistence = Assistence.find(params[:id])
    end

     # Never trust parameters from the scary internet, only allow the white list through.
    def assistence_params
      params[:assistence][:student_id] = Student.find_by(code: params[:assistence][:student_id]).id
      params.require(:assistence).permit(:student_id, :signature, :work_day_id)  
    end


end
