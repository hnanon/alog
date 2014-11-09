class DevicesController < ApplicationController
  def index
    @devices = Device.all
  end

  def show
    @device = Device.find(params[:id])
  end

  def new
    @device = Device.new
    @carriers = Carrier.all
    @manufacturers = Manufacturer.all
  end

  def create
    @device = Device.new(device_params)
    if @device.save
      flash.notice = "Device '#{@device.model}' was succefully created."
      redirect_to device_path(@device)
    else
      render 'new'
    end
  end

  def edit
    @device = Device.find(params[:id])
    @locations = Location.all
    @vendors = Vendor.all
  end

  def update
    if @device.update(device_params)
      redirect_to @device, :notice => "Device updated."
    else
      render :update
    end
  end

  def destroy
    @device = Device.find(params[:id])
    @device.destroy
    redirect_to devices_path, notice: "Device was successfully destroyed."
  end

  private

  def device_params
    params.require(:device).permit(:model, :manufacturer_id, :carrier_id)
  end
end

