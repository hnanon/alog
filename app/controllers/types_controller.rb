class TypesController < ApplicationController
  def index
  end

  def show
    @type = Type.find(params[:id])
  end

  def new
    @type = Type.new
  end

  def create
    @type = Type.new(type_params)
    if @type.save
      flash.notice = "Type '#{@type.name}' was succefully created."
      redirect_to new_type_path
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

  def type_params
    params.require(:type).permit(:name)
  end
end
