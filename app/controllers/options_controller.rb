class OptionsController < ApplicationController
  def index
  end

  def show
    @option = Option.find(params[:id])
  end

  def new
    @option = Option.new
  end

  def create
    @option = Option.new(option_params)
    if @option.save
      flash.notice = "Option '#{@option.name}' was succefully created."
      redirect_to new_option_path
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

  def option_params
    params.require(:option).permit(:name)
  end
end
