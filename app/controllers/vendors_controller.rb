class VendorsController < ApplicationController
  def index
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      flash.notice = "Vendor '#{@vendor.name}' was succefully created."
      redirect_to new_vendor_path
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

  def vendor_params
    params.require(:vendor).permit(:name, :website, :description)
  end
end
