class RemoveVendorFromOrders < ActiveRecord::Migration
  def change
    remove_reference :orders, :vendor, index: true
  end
end
