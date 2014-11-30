class ProductsController < ApplicationController
  def index
    @products = Product.all
    @variants = Variant.all
  end

  def show
    @product = Product.find(params[:id])
    @product.variants.build
    #@variants = @product.variants.find(params[:id])
    @line_item = LineItem.new
  end

  def new
    @product = Product.new
    @product.variants.build
    #@product.carriers.build
    #@product.manufacturers.build
    #@product.devices.build
    #@carriers = Carrier.all
    @manufacturers = Manufacturer.all
    @devices = Device.all
    @types = Type.all
    @vendors = Vendor.all
    @variants = Variant.all
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
    params.require(:product).permit(:name, :description, :type_id, :vendor_id, :device_id , variants_attributes: [:id, :name, :price, :compare_at_price, :sku, :barcode, :weight, :weight_uom, :taxable, :require_shipping, :inventory_policy, :quantity, :_destroy])
  end
end