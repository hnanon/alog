class ManufacturersController < ApplicationController
  def index
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      flash.notice = "Manufacturer '#{@manufacturer.name}' was succefully created."
      redirect_to new_manufacturer_path
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

  def manufacturer_params
    params.require(:manufacturer).permit(:name)
  end
end
