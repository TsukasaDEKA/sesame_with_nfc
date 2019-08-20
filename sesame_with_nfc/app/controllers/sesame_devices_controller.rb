class SesameDevicesController < ApplicationController
  before_action :set_sesame_device, only: [:show, :edit, :update, :destroy]

  # GET /sesame_devices
  # GET /sesame_devices.json
  def index
    @sesame_devices = SesameDevice.all
  end

  # GET /sesame_devices/1
  # GET /sesame_devices/1.json
  def show
  end

  # GET /sesame_devices/new
  def new
    @sesame_device = SesameDevice.new
  end

  # GET /sesame_devices/1/edit
  def edit
  end

  # POST /sesame_devices
  # POST /sesame_devices.json
  def create
    @sesame_device = SesameDevice.new(sesame_device_params)

    respond_to do |format|
      if @sesame_device.save
        format.html { redirect_to @sesame_device, notice: 'Sesame device was successfully created.' }
        format.json { render :show, status: :created, location: @sesame_device }
      else
        format.html { render :new }
        format.json { render json: @sesame_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sesame_devices/1
  # PATCH/PUT /sesame_devices/1.json
  def update
    respond_to do |format|
      if @sesame_device.update(sesame_device_params)
        format.html { redirect_to @sesame_device, notice: 'Sesame device was successfully updated.' }
        format.json { render :show, status: :ok, location: @sesame_device }
      else
        format.html { render :edit }
        format.json { render json: @sesame_device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sesame_devices/1
  # DELETE /sesame_devices/1.json
  def destroy
    @sesame_device.destroy
    respond_to do |format|
      format.html { redirect_to sesame_devices_url, notice: 'Sesame device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sesame_device
      @sesame_device = SesameDevice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sesame_device_params
      params.require(:sesame_device).permit(:organization_id, :device_id, :nickname, :serial)
    end
end
