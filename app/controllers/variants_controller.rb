class VariantsController < ApplicationController
  before_filter :set_product

  def index
  end

  def show
    @variant = Variant.find(params[:id])
  end

  def new
    @variant = Variant.new
    @options = Option.all
  end

  def create
    @variant = Variant.new(variant_params)
    if @variant.save
      flash.notice = "Variant '#{@variant.name}' was succefully created."
      redirect_to new_variant_path
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

    def set_product
      @product = Product.find(params[:product_id])
    end

    def variant_params
      params.require(:variant).permit(:name, :option_id)
    end
end

