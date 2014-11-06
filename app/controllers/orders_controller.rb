class OrdersController < ApplicationController
  def index
    @orders = Order.all
    @vendors = Vendor.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @order.line_items.build
    @locations = Location.all
    @vendors = Vendor.all
  end

  def create
    @order = Order.new(order_params)
    #binding.pry
    if @order.save
      flash.notice = "Order '#{@order.id}' was succefully created."
      redirect_to orders_path
    else
      render 'new'
    end
  end

  def edit
    @order = Order.find(params[:id])
    @locations = Location.all
    @vendors = Vendor.all
  end

  def update
    if @order.update(order_params)
      redirect_to @order, :notice => "Order updated."
    else
      render :update
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path, notice: "Order was successfully destroyed."
  end

  private

  def order_params
    params.require(:order).permit(:location_id, :vendor_id, line_items_attributes: [:product_sku, :product_description])
  end
end
