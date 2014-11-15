class ProductsController < ApplicationController
  def index
    @products = Product.all
    @options = Option.all
    @variants = Variant.all
  end

  def show
    @product = Product.find(params[:id])
    @options = Option.all
    @variants = Variant.all
  end

  def new
    @product = Product.new
    @product.options.build
    @product.product_options.build
    @devices = Device.all
    @types = Type.all
    @variants = Variant.all
    @options = Option.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash.notice = "products '#{@product.name}' was succefully created."
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
    @devices = Device.all
    @types = Type.all
  end

  def update
    if @product.update(product_params)
      redirect_to @product, :notice => "Products updated."
    else
      render :update
    end
  end

  def destroy
    @product = Products.find(params[:id])
    @product.destroy
    redirect_to products_path, notice: "Products was successfully destroyed."
  end

  private

  def product_params
    params.require(:product).permit(:name, :device_id, :type_id, product_options_attributes: [:id, :option_id, :_destroy, variants_attributes: [:id, :name, :_destroy]
      ])
  end
end