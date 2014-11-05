class LocationsController < ApplicationController
  def index
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      flash.notice = "Location '#{@location.address}' was succefully created."
      redirect_to new_location_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def location_params
    params.require(:location).permit(:address, :city, :state, :zipcode)
  end
end
