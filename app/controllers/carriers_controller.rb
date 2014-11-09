class CarriersController < ApplicationController
  def index
  end

  def show
    @carrier = Carrier.find(params[:id])
  end

  def new
    @carrier = Carrier.new
  end

  def create
    @carrier = Carrier.new(carrier_params)
    if @carrier.save
      flash.notice = "Carrier '#{@carrier.name}' was succefully created."
      redirect_to new_carrier_path
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

  def carrier_params
    params.require(:carrier).permit(:name)
  end
end
