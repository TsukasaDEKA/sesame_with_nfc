class DoorLogsController < ApplicationController
  before_action :set_door_log, only: [:show, :edit, :update, :destroy]

  # GET /door_logs
  # GET /door_logs.json
  def index
    @door_logs = DoorLog.all
  end

  # GET /door_logs/1
  # GET /door_logs/1.json
  def show
  end

  # GET /door_logs/new
  def new
    @door_log = DoorLog.new
  end

  # GET /door_logs/1/edit
  def edit
  end

  # POST /door_logs
  # POST /door_logs.json
  def create
    @door_log = DoorLog.new(door_log_params)

    respond_to do |format|
      if @door_log.save
        format.html { redirect_to @door_log, notice: 'Door log was successfully created.' }
        format.json { render :show, status: :created, location: @door_log }
      else
        format.html { render :new }
        format.json { render json: @door_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /door_logs/1
  # PATCH/PUT /door_logs/1.json
  def update
    respond_to do |format|
      if @door_log.update(door_log_params)
        format.html { redirect_to @door_log, notice: 'Door log was successfully updated.' }
        format.json { render :show, status: :ok, location: @door_log }
      else
        format.html { render :edit }
        format.json { render json: @door_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /door_logs/1
  # DELETE /door_logs/1.json
  def destroy
    @door_log.destroy
    respond_to do |format|
      format.html { redirect_to door_logs_url, notice: 'Door log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_door_log
      @door_log = DoorLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def door_log_params
      params.require(:door_log).permit(:sesame_device_id, :user_id, :before_door_status, :after_door_status)
    end
end
